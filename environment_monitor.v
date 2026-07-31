module environment_monitor (
input clk,
input flame_d0,
input mq135_d0,
input [11:0] lm35_adc,
output reg [7:0] leds,
output reg buzzer
);
reg [23:0] counter = 0;
reg blink = 0;
wire flame_detected;
wire gas_detected;
wire temp_high;
assign flame_detected = (flame_d0 == 0); // Flame sensor: LOW → detected
assign gas_detected = (mq135_d0 == 0); // MQ135: LOW → detected
assign temp_high = (lm35_adc &gt; 12&#39;d310); // LM35: &gt;25°C
always @(posedge clk) begin
counter &lt;= counter + 1;
if (counter &gt;= 24&#39;d5000000) begin
counter &lt;= 0;
blink &lt;= ~blink;
end
leds &lt;= 0;
buzzer &lt;= 0;
// Flame sensor → LEDs 0 &amp; 1
if (flame_detected) begin
leds[0] &lt;= blink;
leds[1] &lt;= blink;
end else begin
leds[0] &lt;= blink;
leds[1] &lt;= 0;
end
// MQ135 → LEDs 2 &amp; 3
if (gas_detected) begin
leds[2] &lt;= blink;
leds[3] &lt;= blink;
end else begin
leds[2] &lt;= blink;
leds[3] &lt;= 0;

end
// LM35 → LEDs 4 &amp; 5
if (temp_high) begin
leds[4] &lt;= blink;
leds[5] &lt;= blink;
end else begin
leds[4] &lt;= blink;
leds[5] &lt;= 0;
end
// Buzzer logic
if (flame_detected &amp;&amp; gas_detected &amp;&amp; temp_high) begin
buzzer &lt;= 1; // All three detected → buzzer ON
end else begin
buzzer &lt;= 0;
end
end
endmodule