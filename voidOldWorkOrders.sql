set role rwbrj;

--already voided encounters for the Work Order ids
--272948, 272920, 269771, 269768, 272912, 272915, 287478, 287474, 287479, 287477, 297146, 297145, 272954, 272909,
--272929, 269729, 272877, 272935, 272870, 272867, 269792, 269777, 272880, 269780, 269732, 272951, 269789, 272957,
--269786, 269783, 272938, 272873, 272932, 272883, 269774, 272926, 272923, 273300, 269694

-- 2312 records to update
update encounter
set is_voided               = true,
    last_modified_date_time = current_timestamp + (encounter.id % 10000) * '1 milliseconds'::interval
from individual i
where i.id = individual_id
  and subject_type_id = (select id from subject_type where name = 'Work Order')
  and registration_date < '2022-02-01'
  and not i.is_voided
  and not encounter.is_voided;

--already voided Work Order ids 393654, 393194, 393651, 393609
--update the rest whose registration date is before Feb 2022

-- 59 records to update
update individual
set is_voided               = true,
    last_modified_date_time = current_timestamp + (id % 10000) * '1 milliseconds'::interval
where subject_type_id = (select id from subject_type where name = 'Work Order')
  and registration_date < '2022-02-01'
  and not is_voided;
