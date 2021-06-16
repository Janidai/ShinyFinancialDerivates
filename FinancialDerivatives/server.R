server <- function(input, output) {
  
  #--------------------------------------------------------  
  # Bloack Scholes Merton 1973
  #--------------------------------------------------------
  # Define black scholes function
  output$bsm_theory <- renderUI({includeHTML("files/black_scholes_merton/black_scholes_merton.html")})
  BS <-  function(x) {
    S=x[1]; K=x[2]; T=x[3]; v=x[4]; rf=x[5]; dv=x[6]
    d1 = (log(S/K) + (rf-dv+0.5*v^2)*T)/(v*sqrt(T))
    d2 = d1 - v*sqrt(T)
    bscall = S*exp(-dv*T)*pnorm(d1) - K*exp(-rf*T)*pnorm(d2)
    bsput = -S*exp(-dv*T)*pnorm(-d1) + K*exp(-rf*T)*pnorm(-d2)
    res = c(bscall,bsput)
  }
  
  data <- reactive({
    #Get inputs
    matrix(c(input$stockprice,input$strike,input$maturity,
             input$volatility,input$riskfreerate,input$divrate))
  })
  
  # Call option price
  output$BScall <- renderText({ 
    res = round(BS(data())[1],4)
  })
  
  # Put option price
  output$BSput <- renderText({ 
    res = round(BS(data())[2],4)
  })
  
  # Call plot
  output$plotCall <- renderPlot({
    vcall = NULL; vput = NULL
    K = data()[2]
    strikes = seq(K-30,K+30)
    for (k in strikes) {
      d = data(); d[2]=k
      vcall = c(vcall,BS(d)[1])
      vput = c(vput,BS(d)[2])
    }
    df = data.frame(strikes,vcall,vput)
    ggplot(df,aes(x=strikes,y=vcall)) + geom_point(color=strikes)
  }, height = 350, width = 600)
  
  # Put plot
  output$plotPut <- renderPlot({
    vcall = NULL; vput = NULL
    K = data()[2]
    strikes = seq(K-30,K+30)
    for (k in strikes) {
      d = data(); d[2]=k
      vcall = c(vcall,BS(d)[1])
      vput = c(vput,BS(d)[2])
    }
    df = data.frame(strikes,vcall,vput)
    ggplot(df,aes(x=strikes,y=vput)) + geom_point(color=strikes)
  }, height = 350, width = 600)
}
