# -*- coding: utf-8 -*-
"""NFL_Game_Predictor

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1heapBmcLGmXoNmbZaaruGfrBxVU-B2V7
"""

!pip install nfl_data_py pandas

import nfl_data_py as nfl

seasons = list(range(2020, 2024))
nfl_data = nfl.import_schedules(seasons)

nfl_data.columns
nfl_data.to_excel("nfl_schedules_2020_to_2023.xlsx", index=False)
print("\nData saved to 'nfl_schedules_2020_to_2023.xlsx'")

from google.colab import drive
drive.mount('/content/drive')

# Define the file path in your Google Drive
file_path = "/content/drive/My Drive/nfl_schedules_2020_to_2023.xlsx"

# Save the Excel file to Google Drive
nfl_data.to_excel(file_path, index=False)

print(f"File saved to {file_path}")

columns_to_keep = [
       'season', 'game_type', 'week', 'weekday',
       'away_team', 'away_score', 'home_team', 'home_score',
       'location', 'total', 'overtime', 'away_rest', 'home_rest',
       'away_moneyline', 'home_moneyline', 'spread_line', 'away_spread_odds',
       'home_spread_odds', 'total_line', 'under_odds', 'over_odds', 'div_game',
       'roof', 'surface', 'temp', 'wind']

nfl_data = nfl_data[columns_to_keep]

nfl_data.to_csv('nfl_Data_cleaned.csv', index=False)

# this is to make sure wind and temp all have something
nfl_data.loc[nfl_data['wind'].isna(), 'wind'] = 0
nfl_data.loc[nfl_data['temp'].isna(), 'temp'] = 65
nfl_data.loc[nfl_data['surface'].isna(), 'surface'] = 1.0

nfl_data = nfl_data.replace({'Home': 1.0, 'Neutral': 0.0,  'grass': 1.0, 'fieldturf': 0.0, 'astroturf' : 0.0, 'a_turf':0.0, 'matrixturf': 0.0, 'Monday': 1.0, 'Sunday': 7.0, 'Tuesday': 2.0, 'Saturday': 6.0, 'Wednesday':3, 'Thursday':4.0, 'Friday':5,  'dome': 0.0, 'closed': 0.0, 'outdoors':1.0, 'REG': 1.0, "WC":2.0, 'DIV': 3.0,
                             'CON':4.0, 'SB':5.0, 'open': 0.0, 'grass ':1.0, 'sportturf': 0})

import pandas as pd
from sklearn.preprocessing import LabelEncoder
# Combine all unique team names
all_teams = pd.concat([nfl_data['home_team'], nfl_data['away_team']]).unique()

encoder = LabelEncoder()
# Fit the LabelEncoder
encoder.fit(all_teams)

# Encode home and away teams
nfl_data['home_team'] = encoder.transform(nfl_data['home_team'])
nfl_data['away_team'] = encoder.transform(nfl_data['away_team'])

nfl_data.info()

#print(nfl_data['surface'].unique())

nfl_data

def get_game_result(row):
    if row['home_score'] > row['away_score']:
        return 1  # Home team wins
    elif row['away_score'] > row['home_score']:
        return 0  # Away team wins
    else:
        return 2  # Tie

nfl_data['result'] = nfl_data.apply(get_game_result, axis=1)

nfl_data.drop(['away_score', 'home_score'], axis=1, inplace=True)

X = nfl_data.drop(['result'], axis = 1)
y = nfl_data['result']

from sklearn.linear_model import LogisticRegressionCV
model = LogisticRegressionCV(cv = 5)
model.fit(X,y)

from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

from sklearn.ensemble import RandomForestClassifier

model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

from sklearn.metrics import accuracy_score

y_pred = model.predict(X_test)

accuracy = accuracy_score(y_test, y_pred)
print(f'Accuracy: {accuracy:.2f}')

from sklearn.preprocessing import LabelEncoder

def predict_game_winner(home_team_name, away_team_name, game_type, temp, wind, surface, roof, spread_line):
    # Encode the team names
    home_team_encoded = encoder.transform([home_team_name])[0]
    away_team_encoded = encoder.transform([away_team_name])[0]

    # Create a data dictionary for the input
    input_data = {
        'home_team': [home_team_encoded],
        'away_team': [away_team_encoded],
        'game_type': [game_type],
        'temp': [temp],
        'wind': [wind],
        'surface': [surface],
        'roof': [roof],
        'spread_line': [spread_line],
    }

    # Convert to DataFrame
    input_df = pd.DataFrame(input_data)

    # Predict the outcome
    prediction = model.predict(input_df)[0]

    # Interpret the result
    if prediction == 1:
        result = f"Predicted Winner: {home_team_name} (Home Team)"
    elif prediction == 0:
        result = f"Predicted Winner: {away_team_name} (Away Team)"
    else:
        result = "Predicted Result: Tie"

    return result