 #Invoke chaincode on peers of all Orgs

echo "POST invoke chaincode on peers of Org1 and Org2 and Org3"
echo
TRX_ID=$(curl -s -X POST \
  http://localhost:4000/channels/rxmed/chaincodes/mycc \
  -H "authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1NDQ2MzUyMTksInVzZXJuYW1lIjoiVGl0dHUiLCJvcmdOYW1lIjoiT3JnMyIsImlhdCI6MTU0NDU5OTIxOX0.qtvQ4RTdXFPk2OkOlYzWOiCUDYwE60ftNa1twTHXYKw" \
  -H "content-type: application/json" \
  -d '{
	"peers": ["peer0.org1.rxmed.com","peer0.org2.rxmed.com","peer0.org3.rxmed.com"],
	"fcn":"createPatientPrivate",
	"args":["PAT6","PATID4","AAAA QQQQ", "22/34/1978", "AB+","cccccc111"]
}')
 echo "Transaction ID is $TRX_ID"


# Medication='[{"MedName":"name", "Compound": "comp", "Dosage": "dos", "Quantity": "qty"},{"MedName":"name1", "Compound": "comp1", "Dosage": "dos1", "Quantity": "qty1"}]'                                                                  
# echo "POST invoke chaincode on peers of Org1 and Org2 and Org3"
# echo
# TRX_ID=$(curl -s -X POST \
#   http://localhost:4000/channels/rxmed/chaincodes/mycc \
#   -H "authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1NDQ1NTc2MjcsInVzZXJuYW1lIjoiSmltIiwib3JnTmFtZSI6Ik9yZzEiLCJpYXQiOjE1NDQ1MjE2Mjd9.wLSvafDXs6gh7Om4BEVvCnr8qN3v9dT-kKqqxrpw4L8" \
#   -H "content-type: application/json" \
#   -d "{
# 	\"peers\": [\"peer0.org1.rxmed.com\",\"peer0.org2.rxmed.com\",\"peer0.org3.rxmed.com\"],
# 	\"fcn\":\"createPatient\",
# 	\"args\":[\"PRESC2\",\"PAT1\",$Medication, \"68101\"]
# }")
#  echo "Transaction ID is $TRX_ID"



 curl -s -X GET \
  "http://localhost:4000/channels/rxmed/chaincodes/mycc?peer=peer1.org2.rxmed.com&fcn=query&args=%5B%22PAT6%22%5D" \
  -H "authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1NDQ2MzUyMTksInVzZXJuYW1lIjoiVGl0dHUiLCJvcmdOYW1lIjoiT3JnMyIsImlhdCI6MTU0NDU5OTIxOX0.qtvQ4RTdXFPk2OkOlYzWOiCUDYwE60ftNa1twTHXYKw
" \
  -H "content-type: application/json"