#define step
with(instances_matching_ne(ExploGuardian, "vaultCheck", 1)){
	vaultCheck = 1;
	if(random(2)){
		vault = 1;
		raddrop += 15;
		maxhealth *= 1.75;
		my_health *= 1.75;
	}
}
with(instances_matching(ExploGuardian, "vault", 1)){
	if(my_health <= 0){
		repeat 5 with(instance_create(x,y,GreenExplosion)){}
		for(var i = 0; i < 360; i += 22.5){
			with(instance_create(x,y,ThroneBeam)){
				if(instance_exists(other)){
					team = other.team;
					direction = i;
					image_angle = i;
					speed = 8;
				}
			}
		}
	}
	if("charging" in self && charging && alarm2 <= 0){
		repeat(12){
			if(fork()){
				var dir = random(360);
				repeat(3){
					x = xprevious;
					y = yprevious;
					with(instance_create(x,y,ThroneBeam)){
						if(instance_exists(other)){
							team = other.team;
							direction = dir;
							image_angle = dir;
							speed = 8;
						}
					}
					wait(2);
				}
				exit;
			}
		}
		charging = false;
		alarm1 += 15;
	}
	if(alarm2 > 0 && (!("charging" in self) || !charging)){
		charging = 1;
		alarm2 *= 1.5;
	}
}
