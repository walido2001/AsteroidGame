module ClockDivider(cin,cout);

//Taken from in course labs (50 Mhz Clock)

input cin;
output reg cout = 0;

reg[31:0] count = 32'd0;
parameter D = 32'd1;

always @(posedge cin)
begin
   count <= count + 32'd1;
      if (count >= (D-1)) begin
         cout <= ~cout;
         count <= 32'd0;
      end
end

endmodule
