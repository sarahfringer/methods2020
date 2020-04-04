# load packages 
using DataFrames 
using CSV

# need to add complications?????
# load data into DataFrames  

# admissions dataframe
a_df = CSV.File("C:\\Users\\Angelina Ossimetha\\methods2020\\class_files-2020\\data\\mimic_demo\\ADMISSIONS.csv"; 
select=[:subject_id, :admittime, :dischtime, :deathtime, :insurance, :language, :religion, :marital_status, :ethnicity,:hospital_expire_flag],
 header = 1, footerskip = 0) |> DataFrame

# DIAGNOSES dataframe
d_df = CSV.File("C:\\Users\\Angelina Ossimetha\\methods2020\\class_files-2020\\data\\mimic_demo\\DIAGNOSES_ICD.csv"; 
select=[:subject_id, :icd9_code], header = 1, footerskip = 0) |> DataFrame 

#patients dataframe
p_df =  CSV.File("C:\\Users\\Angelina Ossimetha\\methods2020\\class_files-2020\\data\\mimic_demo\\PATIENTS.csv";
select=[:subject_id, :gender], header = 1, footerskip = 0) |> DataFrame  

#icustays dataframe
i_df =  CSV.File("C:\\Users\\Angelina Ossimetha\\methods2020\\class_files-2020\\data\\mimic_demo\\ICUSTAYS.csv"; 
select=[:subject_id, :los], header = 1, footerskip = 0) |> DataFrame 

#mereged data
merge_dfs = join(a_df, d_df, p_df, i_df,on = :subject_id)   
data = groupby(merge_dfs, :subject_id; sort=true) 


display(data)
 