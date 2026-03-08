from google.genai import Client

client = Client()
response_1 = client.models.generate_content(
    model=MODEL_ID,
    contents='Hello',
)
response_2 = client.models.generate_content(
    model=MODEL_ID,
    contents='Ask a question',
)
# Close the sync client to release resources.
client.close()
