-- Top 10 hospitals ordered descending by the total ICU or SICU license beds.
select b.business_name as hospital_name, f.license_beds as total_license_beds, t.bed_desc
from Hospital_Nursing.bed_fact f
join Hospital_Nursing.bed_type t on
f.bed_id = t.bed_id
inner join Hospital_Nursing.business b
on b.ims_org_id = f.ims_org_id
where f.bed_id =4 OR f.bed_id=15
order by f.license_beds DESC limit 10;

-- -- Top 10 hospitals ordered descending by the total ICU or SICU census beds.
select b.business_name, f.census_beds, t.bed_desc
from Hospital_Nursing.bed_fact f
join Hospital_Nursing.bed_type t on
f.bed_id = t.bed_id
left join Hospital_Nursing.business b
on b.ims_org_id = f.ims_org_id
where f.bed_id = 4 OR f.bed_id = 15
order by f.census_beds DESC limit 10;

-- -- Top 10 hospitals ordered descending by the total ICU or SICU Staffed beds.
select b.business_name, f.staffed_beds, t.bed_desc
from Hospital_Nursing.bed_fact f
join Hospital_Nursing.bed_type t on
f.bed_id = t.bed_id
left join Hospital_Nursing.business b
on b.ims_org_id = f.ims_org_id
where f.bed_id = 4 OR f.bed_id = 15
order by f.staffed_beds DESC limit 10;

-- Top 10 hospitals ordered descending by the total ICU or SICU

-- license_beds
select b.business_name as hospital_name, sum(f.license_beds) as total_license_beds
from Hospital_Nursing.business b inner join Hospital_Nursing.bed_fact f
on b.ims_org_id = f.ims_org_id
where bed_id in (4,15)
group by hospital_name
having count(hospital_name) > 1
order by total_license_beds desc limit 10;

-- census_beds
select b.business_name as hospital_name, sum(f.census_beds) as total_census_beds
from Hospital_Nursing.business b inner join Hospital_Nursing.bed_fact f
on b.ims_org_id = f.ims_org_id
where bed_id in (4,15)
group by hospital_name
having count(hospital_name) > 1
order by total_census_beds desc limit 10;

-- staffed_beds
select b.business_name as hospital_name, sum(f.staffed_beds) as total_staffed_beds
from Hospital_Nursing.business b inner join Hospital_Nursing.bed_fact f
on b.ims_org_id = f.ims_org_id
where bed_id in (4,15)
group by hospital_name
having count(hospital_name) > 1
order by total_staffed_beds desc limit 10;

