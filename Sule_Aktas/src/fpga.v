module LED_Controller(
    input clk,
    output reg led_red,
    output reg led_blue,
    output reg led_green
);

reg [31:0] timer = 0;

always @(posedge clk) begin
    timer <= timer + 1;
    if (timer >= 0 && timer < 200_000_000) begin // 10 saniye boyunca kırmızı LED yanacak
        led_red <= 1;
        led_blue <= 0;
        led_green <= 0;
    end 
    else if (timer >= 200_000_000 && timer < 310_000_000) begin // 5 saniye boyunca yeşil LED yanacak
        led_red <= 0;
        led_blue <= 0;
        led_green <= 1;
    end 
    else if (timer >= 310_000_000 && timer < 370_000_000) begin // 2 saniye boyunca mavi LED yanacak
        led_red <= 0;
        led_blue <= 1;
        led_green <= 0;
    end 
    else begin // herhangi biri değilse tüm LED'ler kapalı olacak
        led_red <= 0;
        led_blue <= 0;
        led_green <= 0;
        timer <= 0;
    end
end

endmodule