const symptomsAlreadySignedRegExp = r"^[а-яА-Яa-zA-Z0-9-,.:;`()\s]*$";

const symptomsDoctorCouponRegExp = r"^[а-яА-Яa-zA-Z0-9-,.:;`()!?\s]*$";

const dateRegExp =
    r"^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$";

const timeRegExp = r"^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$";

const medInstitutionRegExp = r"^[а-яА-Яa-zA-Z0-9-,.:;`()\s]*$";

const medInstitutionDoctorCouponRegExp = r"^[а-яА-Яa-zA-Z0-9-,.:;`()#№+\s]*$";

const docNameRegExp = r"^[а-яА-Яa-zA-Z0-9-.`\s]*$";

const commentRegExp = r"^[а-яА-Яa-zA-Z0-9-,.:;`()!?\s]*$";
