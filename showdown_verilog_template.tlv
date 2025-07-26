\m5_TLV_version 1d: tl-x.org
\m5
   / A competition template for:
   /
   / /----------------------------------------------------------------------------\
   / | The First Annual Makerchip ASIC Design Showdown, Summer 2025, Space Battle |
   / \----------------------------------------------------------------------------/
   /
   / Each player or team modifies this template to provide their own custom spacecraft
   / control circuitry. This template is for teams using Verilog. A TL-Verilog-based
   / template is provided separately. Monitor the Showdown Slack channel for updates.
   / Use the latest template for submission.
   /
   / Just 3 steps:
   /   - Replace all YOUR_GITHUB_ID and YOUR_TEAM_NAME.
   /   - Code your logic in the module below.
   /   - Submit by Sun. July 26, 11 PM IST/1:30 PM EDT.
   /
   / Showdown details: https://www.redwoodeda.com/showdown-info and in the reposotory README.
   
   use(m5-1.0)
   
   var(viz_mode, devel)  /// Enables VIZ for development.
                         /// Use "devel" or "demo". ("demo" will be used in competition.)


   macro(team_220590277_module, ['
      module team_220590277 (
         //Inputs:
         input logic clk, input logic reset,
         input logic signed [7:0] x [m5_SHIP_RANGE], input logic signed [7:0] y [m5_SHIP_RANGE],   // Positions of your ships, as affected by last cycle's acceleration.
         input logic [7:0] energy [m5_SHIP_RANGE],   // The energy supply of each ship, as affected by last cycle's actions.
         input logic [m5_SHIP_RANGE] destroyed,   // Asserted if and when the ships are destroyed.
         input logic signed [7:0] enemy_x_p [m5_SHIP_RANGE], input logic signed [7:0] enemy_y_p [m5_SHIP_RANGE],   // Positions of enemy ships as affected by their acceleration last cycle.
         input logic [m5_SHIP_RANGE] enemy_cloaked,   // Whether the enemy ships are cloaked, in which case their enemy_x_p and enemy_y_p will not update.
         input logic [m5_SHIP_RANGE] enemy_destroyed, // Whether the enemy ships have been destroyed.
          //Outputs:
         output logic signed [3:0] x_a [m5_SHIP_RANGE], output logic signed [3:0] y_a [m5_SHIP_RANGE],  // Attempted acceleration for each of your ships; capped by max_acceleration (see showdown_lib.tlv).
         output logic [m5_SHIP_RANGE] attempt_fire, output logic [m5_SHIP_RANGE] attempt_shield, output logic [m5_SHIP_RANGE] attempt_cloak,  // Attempted actions for each of your ships.
         output logic [1:0] fire_dir [m5_SHIP_RANGE]   // Direction to fire (if firing). (For the first player: 0 = right, 1 = down, 2 = left, 3 = up)
      );

      // Parameters defining the valid ranges of input/output values can be found near the top of "showdown_lib.tlv".

      // /------------------------------\
      // | Your Verilog logic goes here |
      // \------------------------------/

      // E.g.:
  //ship0
 logic signed [7:0] val1 = -8'sd40;
    logic signed [7:0] val2 = 8'sd0;
    logic signed [7:0] val3 = 8'sd40;
   always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            x_a[0] <= 4'sd0;
        end
        else if (x[0] ==val1 && y[0] ==val1 ) begin
                x_a[0] <= 4'sd1;
            end
       else if (x[0] ==15 && y[0] ==-6 ) begin
                x_a[0] <= -4'sd4;
                y_a[0] <= 4'sd4;
            end
       else if (x[0] ==-35 && y[0] ==-7) begin
                x_a[0] <= 4'sd4;
                y_a[0] <= 4'sd0;
            end
      else if (x[0] ==-27 && y[0] ==-12) begin
                x_a[0] <= 4'sd4;
                y_a[0] <= -4'sd3;
            end
       else if (x[0] ==-47 && y[0] ==34) begin
                x_a[0] <= 4'sd4;
                y_a[0] <= -4'sd4;
            end
        else if (x[0] ==-3 && y[0] ==16) begin
                x_a[0] <= 4'sd4;
                y_a[0] <= 4'sd4;
            end
        else if (x[0] ==9 && y[0] ==-26) begin
                x_a[0] <= 4'sd4;
                y_a[0] <= 4'sd4;
            end
        else if (x[0] ==-15 && y[0] ==22) begin
                x_a[0] <= 4'sd2;
                y_a[0] <= 4'sd4;
            end
        else if (x[0] ==-10 && y[0] ==-15) begin
                x_a[0] <= 4'sd0;
                y_a[0] <= 4'sd4;
        		end
       else if (x[0] ==-10 && y[0] ==-38) begin
                x_a[0] <= 4'sd3;
                y_a[0] <= 4'sd1;
        		end
       else if (x[0] ==35 && y[0] ==-44) begin
                x_a[0] <= -4'sd4;
                y_a[0] <= 4'sd1;
        		end
       else begin
            if(x[0]>=val3 && y[0]>=(val1) ) begin
                y_a[0] <= 4'sd3;
                x_a[0] <= -4'sd1;end
            else if(y[0] >= -20 && x[0]>=20) begin
                y_a[0] <= -4'sd1;
                x_a[0] <= -4'sd2;
               end
            else if(y[0] >=val3 && x[0]>=-2 ) begin
                y_a[0] <= -4'sd1;
                x_a[0] <= 4'sd2;
                end
            
            else if(y[0] >=val3 && x[0]<=30) begin
                y_a[0] <= -4'sd2;
                x_a[0] <= 4'sd2;
               if (x[0]<-50 && x[0]>-30)begin
               y_a[0]=-4'sd2;
               x_a[0] <=4'sd1;end
            end
            
            else if(x[0]>0 && y[0]<0 && x[0]<val3 && y[0]>val1)begin
            	x_a[0]=-4'd3;
               y_a[0]=4'd1;end
            else begin
                x_a[0] <= 4'sd0;
                y_a[0] <= 4'sd0;
            end
        end
  end
  
  //ship2
   logic signed [7:0] val4 = -8'sd8;
    logic signed [7:0] val5 = 8'sd0;
    logic signed [7:0] val6 = -8'sd40;
   always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            x_a[2] <= 4'sd0;
            y_a[2] <= 4'sd0;
        end
        else if (x[2] ==val4 && y[2] ==val6 ) begin
                x_a[2] <= -4'sd1;
            y_a[2] <= 4'sd1;
            end
        else if (x[2] ==-26 && y[2] ==-22 ) begin
                x_a[2] <= 4'sd3;
            y_a[2] <= -4'sd2;
            end
        else if (x[2] ==-32 && y[2] ==6 ) begin
                x_a[2] <= 4'sd2;
            y_a[2] <= 4'sd1;
            end
        else if (x[2] ==-4 && y[2] ==36 ) begin
                x_a[2] <= -4'sd2;
            y_a[2] <= -4'sd4;
            end
        else if (x[2] ==0 && y[2] ==-32 ) begin
                x_a[2] <= 4'sd2;
            y_a[2] <= 4'sd4;
            end
        else if (x[2] ==48 && y[2] ==12) begin
                x_a[2] <= -4'sd2;
            y_a[2] <= 4'sd1;
            end
        else if (x[2] ==52 && y[2] ==43) begin
                x_a[2] <= -4'sd3;
                y_a[2]<= -4'sd3;
            end
        else if (x[2] ==37 && y[2] ==49) begin
                x_a[2] <= 4'sd0;
                y_a[2]<= -4'sd3;
            end
        else if (x[2] ==-41 && y[2] ==-23) begin
                x_a[2] <= 4'sd4;
                y_a[2]<= 4'sd3;
            end
         else if (x[2] ==-13 && y[2] ==-29) begin
                x_a[2] <= 4'sd2;
                y_a[2]<= 4'sd3;
            end
         else if (x[2] ==34 && y[2] ==16) begin
                x_a[2] <= -4'sd2;
                y_a[2]<= 4'sd0;
            end
         else if (x[2] ==44 && y[2] ==34) begin
                x_a[2] <= -4'sd4;
                y_a[2]<= 4'sd0;
            end
         else if (x[2] ==19 && y[2] ==55) begin
                x_a[2] <= 4'sd1;
                y_a[2]<= -4'sd4;
            end
         else if (x[2] ==-35 && y[2] ==-41) begin
                x_a[2] <= 4'sd4;
                y_a[2]<= 4'sd4;
            end
         else if (x[2] ==-35 && y[2] ==-49) begin
                x_a[2] <= 4'sd4;
                y_a[2]<= 4'sd3;
            end
         else if (x[2] ==35 && y[2] ==-16) begin
                x_a[2] <= -4'sd4;
                y_a[2]<= -4'sd1;
            end
         else if (x[2] ==53 && y[2] ==-4) begin
                x_a[2] <= -4'sd4;
                y_a[2]<= -4'sd1;
            end
         else if (x[2] ==9 && y[2] ==24) begin
                x_a[2] <= -4'sd4;
                y_a[2]<= 4'sd2;
            end
         else if (x[2] ==-13 && y[2] ==35) begin
                x_a[2] <= 4'sd4;
                y_a[2]<= 4'sd0;
            end
         else if (x[2] ==-19 && y[2] ==38) begin
                x_a[2] <= 4'sd4;
                y_a[2]<= -4'sd4;
            end
         else if (x[2] ==-5 && y[2] ==33) begin
                x_a[2] <= -4'sd4;
                y_a[2]<= -4'sd3;
            end
         else if (x[2] ==-33 && y[2] ==-33) begin
                x_a[2] <= 4'sd2;
                y_a[2]<= 4'sd4;
            end
         else if (x[2] ==-37 && y[2] ==-41) begin
                x_a[2] <= 4'sd1;
                y_a[2]<= 4'sd1;
            end
         else if (x[2] ==29 && y[2] ==25) begin
                x_a[2] <= -4'sd3;
                y_a[2]<= -4'sd4;
            end
        else if (x[2] ==-1 && y[2] ==-36) begin
                x_a[2] <= 4'sd4;
                y_a[2]<= 4'sd4;
            end
        else if (x[2] ==-9 && y[2] ==26) begin
                x_a[2] <= -4'sd2;
                y_a[2]<= -4'sd4;
            end
        else if (x[2] ==-41 && y[2] ==-2) begin
                x_a[2] <= 4'sd2;
                y_a[2]<= 4'sd2;
            end
       else begin
                x_a[2] <= 4'sd0;
                y_a[2] <= 4'sd0;
           
        end
  end
 
//ship1 
 logic signed [7:0] vals1 = -8'sd50;
logic signed [7:0] vals2 = 8'sd0;
logic signed [7:0] vals3 = 8'sd50;

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        x_a[1] <= 4'sd3;
        y_a[1] <= 4'sd0;
    end
    else if (x[1] == vals1 && y[1] == vals2) begin
        x_a[1] <= 4'sd2;
        y_a[1] <= 4'sd0;
    end 
    else begin
        if(x[1] >= vals2 && y[1] >= 8'sd70) begin
            y_a[1] <= -4'sd4;
            x_a[1] <= 4'sd2;
        end
        else if(y[1] >= -vals2 && x[1] >= 8'sd50) begin
            y_a[1] <= 4'sd3;
            x_a[1] <= 4'sd1;
        end
        else if(y[1] >= vals2 && x[1] >= 8'sd70) begin
            y_a[1] <= 4'sd2;
            x_a[1] <= -4'sd2;
        end
        else if(y[1] >= 8'sd70 && x[1] <= 8'sd40) begin
            y_a[1] <= -4'sd3;
            x_a[1] <= 4'sd3;

            if (x[1] < -8'sd45 && x[1] > -8'sd30) begin
                y_a[1] = -4'sd2;
                x_a[1] <= 4'sd1;
            end
        end
        else if(y[1] >= -8'sd70 && x[1] >= vals2) begin
            y_a[1] <= 4'sd2;
            x_a[1] <= -4'sd2;
        end
        else if(y[1] >= -8'sd70 && x[1] >= 8'sd60) begin
            y_a[1] <= -4'sd3;
            x_a[1] <= 4'sd2;
        end
        else if(y[1] >= vals3 && x[1] >= -8'sd1) begin
            y_a[1] <= -4'sd2;
            x_a[1] <= 4'sd3;
        end
        else if(y[1] >= vals3 && x[1] <= 8'sd40) begin
            y_a[1] <= 4'sd2;
            x_a[1] <= -4'sd3;

            if (x[1] < 8'sd60 && x[1] > vals2) begin
                y_a[1] = -4'sd2;
                x_a[1] <= 4'sd2;
            end
        end
        else if(x[1] > 8'sd0 && y[1] < 8'sd0 && x[1] < vals3 && y[1] > vals2) begin
            x_a[1] = -4'sd3;
            y_a[1] = 4'sd3;
        end
        else begin
            x_a[1] <= 4'sd1;
            y_a[1] <= -4'sd1;
        end
    end
end

//firing

parameter int SHIP_RANGE = 3;
parameter int FIRE_COST = 30;
parameter int CLOAK_COST = 15;
parameter int SHIELD_COST = 25;
parameter int RECOUP_ENERGY = 15;
parameter int MAX_ENERGY = 80;
parameter int SHIP_FIRE_RANGE = 4;
parameter int DANGER_PROXIMITY = 24;
int dx;
int dy;
int manhattan;
int enemy_nearby;

always_latch begin
    if (reset) begin
        for (int i = 0; i < SHIP_RANGE; i++) begin
            attempt_fire[i]   = 1'b0;
            fire_dir[i]       = 2'd0;
        end
    end 
    	else 
      	begin
        	for (int i = 0; i < SHIP_RANGE; i++) begin
            attempt_fire[i]   = 1'd0;
            fire_dir[i]       = 2'bxx;

            if (destroyed[i])
                continue;
                
            enemy_nearby = 0;

            for (int j = 0; j < SHIP_RANGE; j++) begin
                if (enemy_destroyed[j] || enemy_cloaked[j])
                    continue;
                    
                dx = enemy_x_p[j] - x[i];
                dy = enemy_y_p[j] - y[i];
                manhattan = (dx < 0 ? -dx : dx) + (dy < 0 ? -dy : dy);

                if (manhattan <= DANGER_PROXIMITY)
                   enemy_nearby=1;

                if (energy[i] >= FIRE_COST) begin
                    if (((dx>-16 && dx<16) && (dy >= -SHIP_FIRE_RANGE || dy <= SHIP_FIRE_RANGE)) || ((dy>-16 && dy<16) && (dx >= -SHIP_FIRE_RANGE || dx <= SHIP_FIRE_RANGE)) ) begin
                        if (dx >= 0 && (dy>-16 && dy<16) )     begin fire_dir[i] <= 2'b00;attempt_fire[i] <= 1'b1;end  // left
                        if (dx < 0 && (dy>-16 && dy<16) )begin fire_dir[i] <= 2'b10;attempt_fire[i] <= 1'b1;end  // right
                        if (dy >= 0 && (dx>-16 && dx<16) )begin fire_dir[i] <= 2'b11;attempt_fire[i] <= 1'b1;end  // up
                        if (dy < 0 && (dx>-16 && dx<16))begin fire_dir[i] <= 2'b01;attempt_fire[i] <= 1'b1; end // down
                    	end
                end
        		end
    	end
 	end
end

//cloak and shield
always_latch begin
    if (reset) begin
        for (int i = 0; i < SHIP_RANGE; i++) begin
            attempt_shield[i] = 1'b0;
            attempt_cloak[i] = 1'b0;
        end
    end else begin
        for (int i = 0; i < SHIP_RANGE; i++) begin
            attempt_shield[i] = 1'b0;
            attempt_cloak[i] = 1'b0;

            if (destroyed[i])
                continue;

            enemy_nearby = 0;

            for (int j = 0; j < SHIP_RANGE; j++) begin
                if (enemy_destroyed[j] || enemy_cloaked[j])
                    continue;

                dx = enemy_x_p[j] - x[i];
                dy = enemy_y_p[j] - y[i];
                manhattan = (dx < 0 ? -dx : dx) + (dy < 0 ? -dy : dy);
                if ((manhattan <= DANGER_PROXIMITY) || (dx>-8 && dx<8)|| (dy>-8 && dy<8))begin
                    enemy_nearby=1;end
                if (enemy_nearby >= 1 && energy[i] >= SHIELD_COST && ((dx>-8 && dx<8) || (dy>-8 && dy<8) ) )begin
                	attempt_shield[i] = 1'b1;end
                if(energy[i] >= CLOAK_COST && !attempt_shield[i] &&  ((dx>-16 && dx<16)|| (dy>-16 && dy<16)))begin
                		attempt_cloak[i] = 1'b1;end
                
            end
    		end
	end
end

endmodule
   '])

\SV
   // Include the showdown framework.
   m4_include_lib(https://raw.githubusercontent.com/rweda/showdown-2025-space-battle/a211a27da91c5dda590feac280f067096c96e721/showdown_lib.tlv)


// [Optional]
// Visualization of your logic for each ship.
\TLV team_220590277_viz(/_top, _team_num)
   m5+io_viz(/_top, _team_num)   /// Visualization of your IOs.
   \viz_js
      m5_DefaultTeamVizBoxAndWhere()
      // Add your own visualization of your own logic here, if you like, within the bounds {left: 0..100, top: 0..100}.
      render() {
         // ... draw using fabric.js and signal values. (See VIZ docs under "LEARN" menu.)
         // For example...
         const destroyed = (this.sigVal("team_YOUR_GITHUB_ID.destroyed").asInt() >> this.getIndex("ship")) & 1;
         return [
            new fabric.Text(destroyed ? "I''m dead! ☹️" : "I''m alive! 😊", {
               left: 10, top: 50, originY: "center", fill: "black", fontSize: 10,
            })
         ];
      },


\TLV team_220590277(/_top)
   m5+verilog_wrapper(/_top, YOUR_GITHUB_ID)



// Compete!
// This defines the competition to simulate (for development).
// When this file is included as a library (for competition), this code is ignored.
\SV
   m5_makerchip_module
\TLV
   // Enlist teams for battle.
   
   // Your team as the first player. Provide:
   //   - your GitHub ID, (as in your \TLV team_* macro, above)
   //   - your team name--anything you like (that isn't crude or disrespectful)
   m5_team(220590277, Stirs)
   
   // Choose your opponent.
   // Note that inactive teams must be commented with "///", not "//", to prevent M5 macro evaluation.
  ///m5_team(random, Random)
   ///m5_team(sitting_duck, Sitting Duck)\
   
   
   // Instantiate the Showdown environment.
   m5+showdown(/top, /secret)
   
   *passed = /secret$passed || *cyc_cnt > 600;   // Defines max cycles, up to ~600.
   *failed = /secret$failed;
\SV
   endmodule
   // Declare Verilog modules.
   m4_ifdef(['m5']_team_\m5_get_ago(github_id, 0)_module, ['m5_call(team_\m5_get_ago(github_id, 0)_module)'])
   m4_ifdef(['m5']_team_\m5_get_ago(github_id, 1)_module, ['m5_call(team_\m5_get_ago(github_id, 1)_module)'])
