set role rwbrj;

--already voided encounters ids
--272948, 272920, 269771, 269768, 272912, 272915, 287478, 287474, 287479, 287477, 297146, 297145, 272954, 272909,
--272929, 269729, 272877, 272935, 272870, 272867, 269792, 269777, 272880, 269780, 269732, 272951, 269789, 272957,
--269786, 269783, 272938, 272873, 272932, 272883, 269774, 272926, 272923, 273300, 269694

-- 2528 records to update
update encounter
set is_voided               = true,
    last_modified_date_time = current_timestamp + (encounter.id % 10000) * '1 milliseconds'::interval
from individual i
where i.id = individual_id
  and registration_date < '2022-02-01'
  and not i.is_voided
  and not encounter.is_voided;

--already voided Subject ids
--444463, 435082, 434763, 434760, 434759, 434758, 434757, 432046, 432045, 432044, 432043, 432042, 432041, 428362, 428361, 428360,
--428359, 428358, 428357, 428356, 428351, 428350, 428349, 428348, 428347, 428346, 428345, 428344, 428343, 415016, 393654, 393651,
--393609, 393194, 393192, 393191

-- 368 records to update
update individual
set is_voided               = true,
    last_modified_date_time = current_timestamp + (id % 10000) * '1 milliseconds'::interval
where registration_date < '2022-02-01'
  and not is_voided;
