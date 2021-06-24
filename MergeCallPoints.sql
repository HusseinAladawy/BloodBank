Merge into volunteer as tab1 
using(select volunteerid, count(callid) as callpoints from volunteercalls group by volunteerid) as tab2 
   on tab1.v_id=tab2.volunteerid 
when matched then 
   update set 
   tab1.callpoints=tab2.callpoints; 
   
--when not matched then 
--   insert values(tab2.PersonID,tab2.LastName,tab2.FirstName,tab2.Address,tab2.Amount,tab2.payment_mode); stName,tab2.FirstName,tab2.Address,tab2.Amount,tab2.payment_mode); 
