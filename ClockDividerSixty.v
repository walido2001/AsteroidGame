module ClockDividerSixty(cin,cout);

//Taken from in course labs

input cin;
output reg cout;

reg[31:0] count; 
parameter D = 32'd1000000;

always @(posedge cin)
begin
   count <= count + 32'd1;
      if (count >= (D-1)) begin
         cout <= 1;
         count <= 32'd0;
      end
        else begin
            cout <= 0;
        end
end


endmodule