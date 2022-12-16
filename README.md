# capm
CAPM Modelling in SAS

This project is an evolving solution to creating a CAPM model in SAS. I want to explore econometric modelling and the relationships between various financial metrics and their impact on financial outcomes.

-------------------------------------------------------------------------------------------------------------

GOAL: Use statistics to build a CAPM model and predict expected returns of stocks.


The Capital Asset Pricing Model (CAPM) is an important model in the field of finance. It explains variations in the rate of return on security as a function of the rate of return on a portfolio consisting of all publicly traded stocks, which is called the market portfolio. 

Generally, the rate of return on any investment is measured relative to its opportunity cost, which is the return on a risk- free asset. The resulting difference is called the risk premium since it is the reward or punishment for making a risky investment. The CAPM says that the risk premium on security j is proportional to the risk premium on the market portfolio. That is,

𝑟j − 𝑟f = 𝛽j (𝑟m − 𝑟f ) 

where rj and rf are the returns to security j and the risk-free rate, respectively, 
      rm is the return on the market portfolio, 
      𝛽j is the jth security’s ‘‘beta’’ value. 

A stock’s beta is important toinvestors since it reveals the stock’s volatility. It measures the sensitivity of security j’s return to variation in the whole stock market. As such, values of beta less than 1 indicate that the stock is ‘‘defensive’’ since its variation is less than the market’s. A beta greater than 1 indicates an ‘‘aggressive stock.’’ Investors usually want an estimate of a stock’s beta before purchasing it. 

The CAPM model shown above is the ‘‘economic model’’ in this case. The ‘‘econometric model’’ is obtained by including an intercept in the model (even though theory says it should be zero) and an error term,

𝑟j − 𝑟f = 𝛼j + 𝛽j(𝑟m − 𝑟f) + 𝑒j

where 𝛼j is the alpha intercept of j security
      ej is the error term of j security

