# server.R
library(ggplot2)

shinyServer(function(input, output) {
  
    p12func <- reactive({
         input$slider1        
    })
    p1fecun <- reactive({
         input$slider2        
    })
   p2fecun <- reactive({
         input$slider3        
   })  
    p1gen <- reactive({
         input$slider4        
   })  


    p2gen <- reactive({
         input$slider5        
   })  
   genfunc <- reactive({
         input$slider6        
   })  

    output$plot1 <- renderPlot({
                                       
        p1f <- p1fecun()   
        p2f <- p2fecun() 
        p1g <- p1gen() 
        p2g <- p2gen()  
        gens <- genfunc() ##  number of generations
        p12 <- p12func()  ##proportion of carrier births
       
        #pop1 <- vector( mode="integer", length=gens)  ## wild type
        #pop2 <- vector( mode="integer", length=gens)  ## carriers
        t <- seq(20, 200, by=20)
        
        x.h <- p1f^(t/p1g)
        x.i <- p2f^(t/p2g)
        
        delta <- format(abs( x.h[10] - x.i[10] ), scientific=TRUE, digits=3)
        ycoord <- 0.5*(max(x.h[10], x.i[10]))
        ycoord2 <- 0.2*(max(x.h[10], x.i[10]))
        
        xcoord <- 170 
        
        d <- data.frame(cbind(t, x.h, x.i))
        ggplot(d, aes(t, x.h)) + geom_point( aes(size=3)) + labs(title="Fecundity X Generation Time") + geom_point(data=d, aes(t, x.i, col="red", size=3)) + annotate("text", x = xcoord, y = ycoord, label = paste("Difference after 200 years = ", delta, sep="")) + scale_y_log10() + theme(legend.position="none") + xlab("Years") + ylab("Population Size")
        #ggplot_build(p)
        
    })  
})





