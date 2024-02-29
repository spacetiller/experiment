import streamlit as st
import pandas as pd
 
st.write("""
# My second app
Hello *world!*
""")

number = st.slider("Pick a number", 0, 100)
print(number)

file = st.file_uploader("Pick a file")
for line in file.readline():
    print(line)


print("------END------")

