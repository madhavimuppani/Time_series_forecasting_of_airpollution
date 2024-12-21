# Time_series_forecasting_of_airpollution
SAS Studio
# Time Series Pollution Forecasting in China (2010-2014)

This project explores the use of time series forecasting models to predict air pollution levels in China for 2015, leveraging data from 2010 to 2014. By incorporating weather attributes such as pressure, wind speed, snow, and rain, the project aims to enhance the accuracy of pollution forecasts and provide actionable insights for policymakers and planners.

## Key Highlights:
- **Dataset**: Five years of air pollution and weather data (2010-2014).
- **Goal**: Predict air pollution levels in 2015 to assist in developing strategies for mitigating pollution effects.
- **Challenges**: Lack of clear trends or seasonality in the data, necessitating innovative techniques and the inclusion of exogenous variables.

## Techniques Used:
1. **Simple Exponential Smoothing**
2. **Additive Seasonal Exponential Smoothing**
3. **ARIMA (Differencing = 1)**
4. **Pre-whitening Technique**
5. **ARIMAX Models**:
   - ARIMAX(0,0,0)
   - ARIMAX(1,0,0)
   - ARIMAX(1,0,1)
   - ARIMAX(2,0,1)

## Findings:
- **Pre-whitening** significantly improved data quality, enhancing forecast accuracy.
- The inclusion of exogenous variables (pressure, wind speed, snow, and rain) proved vital for capturing the dynamics of pollution and improving prediction reliability.
- Metrics such as **MAE**, **RMSE**, and **MAPE** were used to evaluate the models, highlighting ARIMAX techniques as highly effective.

## Practical Implications:
The insights gained emphasize the importance of integrating environmental factors into pollution forecasting models. These results can guide policymakers in creating informed strategies to combat pollution and its effects on public health and the environment.

This project demonstrates the power of machine learning and time series techniques in tackling complex forecasting problems with minimal traditional patterns. 
