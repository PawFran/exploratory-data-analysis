unzip("exdata_data_NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)

library(dplyr)

# first plot - total emmissions for each year
png(file = "plot1.png")
emmissions_by_year <- group_by(NEI, year) %>% summarize(total_emmissions = sum(Emissions))
emmissions_by_year
with(emmissions_by_year, plot(year, total_emmissions / 1000, type = 'l', ylab = 'total emmissions in kilotons', xaxt = 'n'))
axis(1, at = c(1999, 2002, 2005, 2008))
dev.off()

# second plot - comparing total emmissions in Baltimore City, Maryland
png(file = "plot2.png")
baltimore1999 <- sum(select(filter(NEI, year == 1999, fips == '24510'), Emissions))
baltimore2008 <- sum(select(filter(NEI, year == 2008, fips == '24510'), Emissions))
plot(c(1999, 2008), c(baltimore1999, baltimore2008), xlab = 'year', ylab = 'total emmissions in Baltimore City, Maryland in tons', ylim = c(0, 3300), xaxt = 'n', pch = 19)
axis(1, at = c(1999, 2008))
dev.off()

# third plot - decrease/increase in all sources between 1999 and 2008
emmissions_by_type <- group_by(NEI, type, year) %>% summarize(total_emmissions = sum(Emissions))
par(mfrow = c(2, 2))
with(emmissions_by_type, plot(year[1:4], total_emmissions[1:4] / 1000, ylab = paste('total emmissions in kilotons NON-ROAD'), xlab = 'year', xaxt = 'n', type = 'l'))
axis(1, at = c(1999, 2002, 2005, 2008))
with(emmissions_by_type, plot(year[5:8], total_emmissions[5:8] / 1000, ylab = 'total emmissions in kilotons NONPOINT', xlab = 'year', xaxt = 'n', type = 'l'))
axis(1, at = c(1999, 2002, 2005, 2008))
with(emmissions_by_type, plot(year[9:12], total_emmissions[9:12] / 1000, ylab = 'total emmissions in kilotons ON-ROAD', xlab = 'year', xaxt = 'n', type = 'l'))
axis(1, at = c(1999, 2002, 2005, 2008))
with(emmissions_by_type, plot(year[13:15], total_emmissions[13:15] / 1000, ylab = 'total emmissions in kilotons POINT', xlab = 'year', xaxt = 'n', type = 'l'))
axis(1, at = c(1999, 2002, 2005, 2008))
par(mfrow = c(1, 1))

png(file = "plot3.png")

library(ggplot2)
g <- ggplot(emmissions_by_type, aes(emmissions_by_type[, 2], emmissions_by_type[, 3] / 1000))
g <- g + geom_point() + geom_line() + facet_grid(.~type)
g <- g + ylab('total emmissions in kilotons') + xlab('year') 
# how to set xlabels ?
g

dev.off()

# fourth - how have emissions from coal combustion-related sources changed from 1999–2008 ?
head(SCC)
head(unique(SCC$EI.Sector))
sector_names <- as.vector(SCC$EI.Sector) # as.vector returns a character vector
grep('coal', sector_names, ignore.case = T)
sector_names[grep('coal', sector_names, ignore.case = T)]
coal_sources <- as.vector(SCC$SCC[grep('coal', sector_names, ignore.case = T)]) # take only those related to coal combustion
class(NEI$SCC)
NEI_coal_comb <- filter(NEI, SCC %in% coal_sources)
head(NEI_coal_comb)
unique(coal_sources)
length(unique(NEI_coal_comb$SCC)) # not exactly the same but maybe its ok
coal_comb_by_year <- group_by(NEI_coal_comb, year) %>% summarize(total_emissions = sum(Emissions))
coal_comb_by_year

png(file = 'plot4.png')
with(coal_comb_by_year, plot(year, total_emissions / 1000, type = 'l', 
                             ylab = 'total emissions in kilotons', main = 'emissions from coal combustion-related sources',
                             xaxt = 'n'))
axis(1, at = c(1999, 2002, 2005, 2008))
dev.off()

# fifth - changes in emissions from motor vehicle sources in Baltimore City between 1999 and 2008
head(sector_names)
unique(sector_names)
unique(sector_names[grep('vehicle', sector_names, ignore.case = T)])
vehicle_sources <- as.vector(SCC$SCC[grep('vehicle', sector_names, ignore.case = T)])

NEI_Baltimore <- filter(NEI, fips == "24510")
NEI_Baltimore_vehicles <- filter(NEI_Baltimore, SCC %in% vehicle_sources)
Baltimore_vehicles_by_year <- group_by(NEI_Baltimore_vehicles, year) %>% summarize(total_emissions = sum(Emissions))
Baltimore_vehicles_by_year

png(file = 'plot5.png')
qplot(year, total_emissions, data = Baltimore_vehicles_by_year, geom = c('point', 'line'), 
      main = 'emissions from motor vehicle sources in Baltimore City 1999-2008',
      ylab = 'total emissions in tons')
dev.off()

# sixth - Baltimore City vs Los Angeles County vehicle related sources' emissions
LA_vehicles_by_year <- filter(NEI, fips == "06037") %>% filter(SCC %in% vehicle_sources) %>% group_by(year) %>% summarize(total_emissions = sum(Emissions))
# merge both tables
LA_vehicles_by_year$region <- 'LA County'
Baltimore_vehicles_by_year$region <- 'Baltimore City'
LA_vehicles_by_year
Baltimore_vehicles_by_year
vehicles_both <- rbind(LA_vehicles_by_year, Baltimore_vehicles_by_year)

png(file = 'plot6.png')
qplot(year, total_emissions, data = vehicles_both, geom = c('point', 'line'), facets = .~region, ylab = 'total emissions in tons')
dev.off()
