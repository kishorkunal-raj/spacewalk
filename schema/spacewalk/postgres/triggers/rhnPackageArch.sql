-- oracle equivalent source sha1 d85243a22650b447d3ee4913acb1fcca83549cdf

create or replace function rhn_parch_mod_trig_fun() returns trigger as
$$
begin
       new.modified := current_timestamp;
        
       return new;
end;
$$ language plpgsql;

create trigger
rhn_parch_mod_trig
before insert or update on rhnPackageArch
for each row
execute procedure rhn_parch_mod_trig_fun();


