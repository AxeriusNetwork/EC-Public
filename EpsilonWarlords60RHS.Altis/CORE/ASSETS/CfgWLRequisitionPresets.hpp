class CfgWLRequisitionPresets
{
    class CAP_RHS // --- class name used in the Init module
    {
        class WEST // --- assets available for BLUFOR
        {
            class Infantry
            {
                class rhsusf_army_ucp_rifleman {
                    cost = 100;
                    requirements[]={};
                };
                class rhsusf_army_ucp_autorifleman {
                    cost = 150;
                    requirements[]={};
                };
                class rhsusf_army_ucp_grenadier {
                    cost = 125;
                    requirements[]={};
                };
                class rhsusf_army_ucp_riflemanat {
                    cost = 250;
                    requirements[]={};
                };
                class rhsusf_army_ucp_machinegunner {
                    cost = 200;
                    requirements[]={};
                };
                class rhsusf_army_ucp_aa {
                    cost = 300;
                    requirements[]={};
                };
                class rhsusf_army_ucp_javelin {
                    cost = 300;
                    requirements[]={};
                };
                class rhsusf_army_ucp_rifleman_m590 {
                    cost = 125;
                    requirements[]={};
                };
                class rhsusf_army_ucp_medic {
                    cost = 125;
                    requirements[]={};
                };
                class rhsusf_army_ucp_maaws {
                    cost = 300;
                    requirements[]={};
                };
                class rhsusf_army_ucp_engineer {
                    cost = 200;
                    requirements[]={};
                };
                class rhsusf_army_ucp_explosives {
                    cost = 400;
                    requirements[]={};
                };
                class rhsusf_army_ucp_sniper {
                    cost = 150;
                    requirements[]={};
                };
                class rhsusf_army_ucp_sniper_m107 {
                    cost = 300;
                    requirements[]={};
                };
                class rhsusf_army_ucp_sniper_m24sws {
                    cost = 300;
                    requirements[]={};
                };
                class rhsusf_army_ucp_uav {
                    cost = 600;
                    requirements[]={};
                };
            };
            class Vehicles
            {
                class rhsusf_m998_w_4dr
                {
                    cost = 50;
                    requirements[]={};
                };
                class rhsusf_m1045_w {
                    cost = 1000;
                    requirements[]={};
                }
                class rhsusf_m1043_w_mk19 {
                    cost = 2500;
                    requirements[]={};
                }
                class rhsusf_m1043_w_m2 {
                    cost = 1400;
                    requirements[]={};
                }
                class rhsusf_m1025_w {
                    cost = 3000;
                    requirements[]={};
                }
            };
            class Aircraft
            {
                // Helicopters
                class RHS_AH64D_wd
                {
                    cost = 6000;
                    requirements[]={"A"};
                };
                class RHS_CH_47F
                {
                    cost = 3500;
                    requirements[]={"A"};
                };
                class RHS_UH60M
                {
                    cost = 3000;
                    requirements[]={"A"};
                };
                class RHS_UH60M2
                {
                    cost = 4500;
                    requirements[]={"A"};
                };
                // Planes
                class RHS_A10 
                {
                    cost = 6500;
                    requirements[]={"A"};
                };
                class rhsusf_f22 
                {
                    cost = 8000;
                    requirements[]={"A"};
                };
                class RHS_C130J 
                {
                    cost = 10000;
                    requirements[]={"A"};
                };
            };
            class Naval
            {
                class B_Boat_Armed_01_hmg_F
                {
                    cost = 500;
                    requirements[]={"W"};
                };
                class rhsusf_mkvsoc
                {
                    cost = 500;
                    requirements[]={"W"};
                };
            };
            class Gear
            {
                class rhsusf_mags_crate {
                    cost = 200;
                    requirements[]={};
                };
                class rhsusf_gear_crate {
                    cost = 200;
                    requirements[]={};
                };
                class rhsusf_launcher_crate {
                    cost = 300;
                    requirements[]={};
                };
                class rhsusf_spec_weapons_crate {
                    cost = 500;
                    requirements[]={};
                };
                class rhsusf_weapon_crate {
                    cost = 250;
                    requirements[]={};
                };
                class Box_NATO_AmmoVeh_F {
                    cost = 500;
                    requirements[]={};
                }
            };
            class Defences
            {
                class RHS_Stinger_AA_pod_WD {
                    cost = 500;
                    requirements[]={};
                };
                class RHS_M2StaticMG_WD {
                    cost = 250;
                    requirements[]={};
                };
                class RHS_M2StaticMG_MiniTripod_WD {
                    cost = 250;
                    requirements[]={};
                };
                class RHS_TOW_TriPod_WD {
                    cost = 500;
                    requirements[]={};
                };
                class RHS_MK19_TriPod_WD {
                    cost = 250;
                    requirements[]={};
                };
            };
        };
        class EAST // --- assets available for OPFOR
        {
            class Infantry
            {
                class B_Soldier_F // --- must be asset class name
                {
                    cost = 100; // --- Command Points required
                    requirements[]={}; // --- dispositions required ("A" = airstrip, "H" = helipad, "W" = water (harbor))
                };
            };
            class Vehicles
            {
                class B_Quadbike_01_F
                {
                    cost = 50;
                    requirements[]={};
                };
            };
            class Aircraft
            {
                class B_Plane_CAS_01_F
                {
                    cost = 7500;
                    requirements[]={"A"};
                };
            };
            class Naval
            {
                class O_Boat_Armed_01_hmg_F
                {
                    cost = 500;
                    requirements[]={"W"};
                };
            };
            class Gear
            {
                class Box_NATO_Ammo_F
                {
                    cost = 200;
                    requirements[]={};
                };
            };
            class Defences
            {
                class B_HMG_01_F
                {
                    cost = 250;
                    requirements[]={};
                };
            };
        };
    };
};