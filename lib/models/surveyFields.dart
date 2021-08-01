class SurveyFields {
  static final String amount = 'Amount';
  static final marketer = 'Marketer Name';
  static String cardNo = 'Card No';
  static final String location = 'Location';
  static final String surname = 'Customer Surname';
  static final String otherNames = 'Customer Name';
  static final String customerType = 'Customer Type';
  static final String customerIdentityType = 'Customer Identity';
  static final String customerTypeID = 'Customer ID';
  static final String bvn = 'BVN';
  static final String otherNumber = 'Other Number';
  static final String dateOfBirth = 'DOB';
  static final String gender = 'Gender';
  static final String maritalStatus = 'Marital Status';
  static final String address = 'Address';
  static final String alternativeSurname = 'Alternative Surname';
  static final String alternativeOtherName = 'Alternative Other Name';
  static final String alternativePhone = 'Alternative Phone';
  static final String alternativeSecondPhone = 'Alternative Second Phone';
  static final String alternativeContactRelationship =
      'Alternative Contact Relationship';
  static final String collectionPoint = 'Collection Point';
  static final String paymentPlan = 'Payment Plan';
  static final String salesAgent = 'Sales Agent';
  static String customerImageUrl = "Customer Image";
  static String customerIDImageUrl = "Customer ID Image";
  static String createdAt = "CreatedAt";

  static List<String> getFields() => [
        amount,
        marketer,
        cardNo,
        location,
        surname,
        otherNames,
        customerType,
        customerIdentityType,
        customerTypeID,
        bvn,
        otherNumber,
        dateOfBirth,
        gender,
        maritalStatus,
        address,
        alternativeSurname,
        alternativeOtherName,
        alternativeSecondPhone,
        alternativeContactRelationship,
        collectionPoint,
        paymentPlan,
        salesAgent,
        customerImageUrl,
        customerIDImageUrl,
        createdAt
      ];
}
