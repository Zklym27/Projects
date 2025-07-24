from tkinter import *
from tkinter import ttk
import tkinter as tk
from PIL import Image, ImageTk


gui = Tk()
gui.geometry("500x600")

fish_data = [
    {"Fish": "Fluke (Summer Flounder)", "Seasons": [
        {"Start_Month": 5, "Start_Day": 4, "End_Month": 9, "End_Day": 25, "Best_Baits": "Pink Shine, Pearl White Gulp", "Size_reg": "3 Fish 18+ Inches"}
    ]},
    {"Fish": "Tautog (Black Fish)", "Seasons": [
        {"Start_Month": 1, "Start_Day": 1, "End_Month": 2, "End_Day": 28, "Best_Baits": "Green Crab, Sand Flea", "Size_reg": "4 Fish 15+ Inches"},
        {"Start_Month": 4, "Start_Day": 1, "End_Month": 4, "End_Day": 30, "Best_Baits": "Clam, Green Crab", "Size_reg": "4 Fish 15+ Inches"},
        {"Start_Month": 8, "Start_Day": 1, "End_Month": 11, "End_Day": 15, "Best_Baits": "Clam, Green Crab", "Size_reg": "1 Fish 15+ Inches"},
        {"Start_Month": 11, "Start_Day": 16, "End_Month": 12, "End_Day": 31, "Best_Baits": "Clam, Green Crab", "Size_reg": "5 Fish 15+ Inches"}

    ]},
    {"Fish": "Black Sea Bass","Seasons":[
        {"Start_Month": 5, "Start_Day": 17, "End_Month": 6, "End_Day": 19, "Best_Baits": "Squid, Clam, Jigs", "Size_reg": "10 Fish 12.5+ Inches"},
        {"Start_Month": 7, "Start_Day": 1, "End_Month": 8, "End_Day": 31, "Best_Baits": "Squid, Clam, Jigs", "Size_reg": "1 Fish 12.5+ Inches"},
        {"Start_Month": 10, "Start_Day": 1, "End_Month": 10, "End_Day": 31, "Best_Baits": "Squid, Clam, Jigs", "Size_reg": "10 Fish 12.5+ Inches"},
        {"Start_Month": 11, "Start_Day": 1, "End_Month": 12, "End_Day": 31, "Best_Baits": "Squid, Clam, Jigs", "Size_reg": "15 Fish 12.5+ Inches"}    
    ]}
]


title_text = Label(gui, text = "NJ 2024 Regulation Checker",font = ('Arial', 14, 'bold'))
title_text.place(x = 120, y = 25)

date_entry_text = Label(gui, text = "Enter date:(MM-DD) ")
date_entry_text.place(x=50, y=100)

fish_entry_text = Label(gui, text = "Select desired species: ")
fish_entry_text.place(x=300, y=100)

date_entry = Entry(gui)
date_entry.place(x=50,y=120,width = 100)

fish_species = [entry['Fish'] for entry in fish_data]
fish_dropdown = ttk.Combobox(gui, values=fish_species)
fish_dropdown.place(x=300, y=120, width=150)  
fish_dropdown.set("Select Species")

images = {
    "Fluke (Summer Flounder)": ImageTk.PhotoImage(Image.open("fluke.png")),
    "Tautog (Black Fish)": ImageTk.PhotoImage(Image.open("tautog.png")),
    "Black Sea Bass": ImageTk.PhotoImage(Image.open("black_sea_bass.png"))
}

fish_image_label = Label(gui)  

def validate_date():
    selected_fish = fish_dropdown.get()
    input_date_str = date_entry.get()
    input_month, input_day = map(int, input_date_str.split('-'))

    best_bait = ""
    size_reg = ""
    valid_season_found = False


    for fish in fish_data:
        if fish['Fish'] == selected_fish:
            for season in fish['Seasons']:
                start_month = season['Start_Month']
                start_day = season['Start_Day']
                end_month = season['End_Month']
                end_day = season['End_Day']

                if start_month <= input_month <= end_month and start_day <= input_day <= end_day:
                    best_bait = season['Best_Baits']
                    size_reg = season['Size_reg']
                    valid_season_found = True
                    break  
                if valid_season_found:
                    break 
    
    if valid_season_found:
        result_label.config(text=f"Valid date for fishing.\n\nBest Bait: {best_bait}\n\nSize Regulation: {size_reg}", font= ('Arial', 14))
        fish_image_label.config(image=images[selected_fish])
        fish_image_label.place(relx=0.45, rely=0.7, anchor="center")
    else:
        result_label.config(text="Invalid date for fishing.\n\n Outside of fishing season.")
        fish_image_label.place_forget()


    
validate_button = Button(gui, text="Validate", command=validate_date)
validate_button.place(x=200, y=160, width=50)


result_label = Label(gui, text="",)
result_label.place(relx=0.45, rely=0.45, anchor="center")





gui.mainloop()