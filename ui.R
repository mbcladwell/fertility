# ui.R

shinyUI(fluidPage(

  title = "Assess mutation load",
  
  plotOutput('plot1'),
  h5("Discussion at", a("lostnation.bit", href="http:www.lostnat.net/2017/07/04/fertility/")),
  hr(),

  fluidRow(
   
    column(4, offset = 1,
          
      h4("Population 1 - Hosts"),
     sliderInput("slider2", label = h3("Fecundity"), min = 1, max = 10, value = 2, step=1),
	sliderInput("slider4", label = h3("Generation time"), min = 12, max = 40, value = 20, step=2)


           ),
    column(4,
      h4("Population 2 - Invaders", style = "color:red"),
    	sliderInput("slider3", label = h3("Fecundity", style = "color:red"), min = 1, max = 10, value = 2, step=1),
	sliderInput("slider5", label = h3("Generation time", style = "color:red"), min = 12, max = 40, value = 15, step=2)



           )
  )
))
