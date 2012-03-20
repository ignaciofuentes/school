# Create admin User
user = User.new(:username=> 'admin',:password=> 'admin123',:email=> 'admin@tucolegionline.com', :language_id=> 1 )
user.authenticatable_type= "Employee"
user.authenticatable_id = 1
user.admin = true
user.save

EmployeeCategory.create :name => 'Tucolegionline Admin',:prefix => 'Admin',:status => true

EmployeePosition.create :name => 'Tucolegionline Admin',:employee_category_id => 1,:status => true

EmployeeDepartment.create :code => 'Admin',:name => 'Tucolegionline Admin',:status => true

EmployeeGrade.create :name => 'Tucolegionline Admin',:priority => 0 ,:status => true,:max_hours_day=>nil,:max_hours_week=>nil

Employee.create :employee_number => 'admin',:joining_date => Date.today,:first_name => 'Admin',:last_name => 'Employee', 
:employee_department_id => 1,:employee_grade_id => 1,:employee_position_id => 1,:employee_category_id => 1,:status => true,
:nationality_id =>'191',:date_of_birth => Date.today-365, :user_id => 1



Configuration.create :config_key => "InstitutionName", :config_value => ""
Configuration.create :config_key => "InstitutionAddress", :config_value => ""
Configuration.create :config_key => "InstitutionPhoneNo", :config_value => ""
Configuration.create :config_key => "StudentAttendanceType", :config_value => "Daily"
Configuration.create :config_key => "CurrencyType", :config_value => "$"
#Configuration.create :config_key => "ExamResultType", :config_value => "Marks"
Configuration.create :config_key => "AdmissionNumberAutoIncrement", :config_value => "1"
Configuration.create :config_key => "EmployeeNumberAutoIncrement", :config_value => "1"
Configuration.create :config_key => "TotalSmsCount", :config_value=>"0"
Configuration.create :config_key => "AvailableModules", :config_value=>"HR"
Configuration.create :config_key => "AvailableModules", :config_value=>"Finance"

clist = [ "Afghanistan",
  "Albania",
  "Algeria",
  "Andorra",
  "Angola",
  "Antigua & Deps",
  "Argentina",
  "Armenia",
  "Australia",
  "Austria",
  "Azerbaijan",
  "Bahamas",
  "Bahrain",
  "Bangladesh",
  "Barbados",
  "Belarus",
  "Belgium",
  "Belize",
  "Benin",
  "Bhutan",
  "Bolivia",
  "Bosnia Herzegovina",
  "Botswana",
  "Brazil",
  "Brunei",
  "Bulgaria",
  "Burkina",
  "Burundi",
  "Cambodia",
  "Cameroon",
  "Canada",
  "Cape Verde",
  "Central African Rep",
  "Chad",
  "Chile",
  "China",
  "Colombia",
  "Comoros",
  "Congo",
  "Congo {Democratic Rep}",
  "Costa Rica",
  "Croatia",
  "Cuba",
  "Cyprus",
  "Czech Republic",
  "Denmark",
  "Djibouti",
  "Dominica",
  "Dominican Republic",
  "East Timor",
  "Ecuador",
  "Egypt",
  "El Salvador",
  "Equatorial Guinea",
  "Eritrea",
  "Estonia",
  "Ethiopia",
  "Fiji",
  "Finland",
  "France",
  "Gabon",
  "Gambia",
  "Georgia",
  "Germany",
  "Ghana",
  "Greece",
  "Grenada",
  "Guatemala",
  "Guinea",
  "Guinea-Bissau",
  "Guyana",
  "Haiti",
  "Honduras",
  "Hungary",
  "Iceland",
  "India",
  "Indonesia",
  "Iran",
  "Iraq",
  "Ireland {Republic}",
  "Israel",
  "Italy",
  "Ivory Coast",
  "Jamaica",
  "Japan",
  "Jordan",
  "Kazakhstan",
  "Kenya",
  "Kiribati",
  "Korea North",
  "Korea South",
  "Kosovo",
  "Kuwait",
  "Kyrgyzstan",
  "Laos",
  "Latvia",
  "Lebanon",
  "Lesotho",
  "Liberia",
  "Libya",
  "Liechtenstein",
  "Lithuania",
  "Luxembourg",
  "Macedonia",
  "Madagascar",
  "Malawi",
  "Malaysia",
  "Maldives",
  "Mali",
  "Malta",
  "Montenegro",
  "Marshall Islands",
  "Mauritania",
  "Mauritius",
  "Mexico",
  "Micronesia",
  "Moldova",
  "Monaco",
  "Mongolia",
  "Morocco",
  "Mozambique",
  "Myanmar, {Burma}",
  "Namibia",
  "Nauru",
  "Nepal",
  "Netherlands",
  "New Zealand",
  "Nicaragua",
  "Niger",
  "Nigeria",
  "Norway",
  "Oman",
  "Pakistan",
  "Palau",
  "Panama",
  "Papua New Guinea",
  "Paraguay",
  "Peru",
  "Philippines",
  "Poland",
  "Portugal",
  "Qatar",
  "Romania",
  "Russian Federation",
  "Rwanda",
  "St Kitts & Nevis",
  "St Lucia",
  "Saint Vincent & the Grenadines",
  "Samoa",
  "San Marino",
  "Sao Tome & Principe",
  "Saudi Arabia",
  "Senegal",
  "Serbia",
  "Seychelles",
  "Sierra Leone",
  "Singapore",
  "Slovakia",
  "Slovenia",
  "Solomon Islands",
  "Somalia",
  "South Africa",
  "Spain",
  "Sri Lanka",
  "Sudan",
  "Suriname",
  "Swaziland",
  "Sweden",
  "Switzerland",
  "Syria",
  "Taiwan",
  "Tajikistan",
  "Tanzania",
  "Thailand",
  "Togo",
  "Tonga",
  "Trinidad & Tobago",
  "Tunisia",
  "Turkey",
  "Turkmenistan",
  "Tuvalu",
  "Uganda",
  "Ukraine",
  "United Arab Emirates",
  "United Kingdom",
  "United States",
  "Uruguay",
  "Uzbekistan",
  "Vanuatu",
  "Vatican City",
  "Venezuela",
  "Vietnam",
  "Yemen",
  "Zambia",
  "Zimbabwe"]

  clist.each do |c|
    @c1 = Country.new
    @c1.name = c
    @c1.save
  end


  FinanceTransactionCategory.create(:name => 'Salary', :description => ' ', :is_income => false)
  FinanceTransactionCategory.create(:name => 'Donation', :description => ' ', :is_income => true)
  FinanceTransactionCategory.create(:name => 'Fee', :description => ' ', :is_income => true)


  Privilege.create :name => "ExaminationControl"
  Privilege.create :name => "EnterResults"
  Privilege.create :name => "ViewResults"
  Privilege.create :name => "Admission"
  Privilege.create :name => "StudentsControl"
  Privilege.create :name => "ManageNews"
  Privilege.create :name => "Timetable"
  Privilege.create :name => "StudentAttendanceView"
  Privilege.create :name => "HrBasics"
  Privilege.create :name => "AddNewBatch"
  Privilege.create :name => "SubjectMaster"
  Privilege.create :name => "EventManagement"
  Privilege.create :name => "GeneralSettings"
  Privilege.create :name => "FinanceControl"
  Privilege.create :name => "TimetableView"
  Privilege.create :name => "StudentAttendanceRegister"
  Privilege.create :name => "EmployeeAttendance"
  Privilege.create :name => "PayslipPowers"
  Privilege.create :name => "EmployeeSearch"
  Privilege.create :name => "SMSManagement"


  Weekday.create :id=>1, :weekday=>"monday"
  Weekday.create :id=>2, :weekday=>"tuesday"
  Weekday.create :id=>3, :weekday=>"wednesday"
  Weekday.create :id=>4, :weekday=>"thursday"
  Weekday.create :id=>5, :weekday=>"friday"
  Weekday.create :id=>6, :weekday=>"saturday"
  Weekday.create :id=>7, :weekday=>"sunday"


  SmsSetting.create :settings_key=>"ApplicationEnabled",:is_enabled=>false
  SmsSetting.create :settings_key=>"ParentSmsEnabled",:is_enabled=>false
  SmsSetting.create :settings_key=>"EmployeeSmsEnabled",:is_enabled=>false
  SmsSetting.create :settings_key=>"StudentSmsEnabled",:is_enabled=>false
  SmsSetting.create :settings_key=>"ResultPublishEnabled",:is_enabled=>false
  SmsSetting.create :settings_key=>"StudentAdmissionEnabled",:is_enabled=>false
  SmsSetting.create :settings_key=>"ExamScheduleResultEnabled",:is_enabled=>false
  SmsSetting.create :settings_key=>"AttendanceEnabled",:is_enabled=>false
  SmsSetting.create :settings_key=>"NewsEventsEnabled",:is_enabled=>false

  Xml.create :finance_name =>"Salary", :ledger_name => ""
  Xml.create :finance_name =>"Fee", :ledger_name => ""
  Xml.create :finance_name =>"Donation", :ledger_name => ""

  Language.create :name   => 'English',:short   => 'en'
  Language.create :name   => 'Espanol',:short   => 'es'


