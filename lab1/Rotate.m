function [Out] = Rotate(In, Theta)
    % 获取图像尺寸
    [rows, cols] = size(In);
    % 1. 初始化输出图像（全黑），确保大小与原图一致
    Out = zeros(rows, cols); 
    
    % 2. 找到图像中心点 (注意大小写要统一)
    centerX = cols / 2;
    centerY = rows / 2;

    % 3. 开始遍历目标图像的每一个像素
    for y = 1:rows
        for x = 1:cols
            % 计算相对于中心的坐标，并进行逆向旋转变换
            % 使用逆向映射公式：旋转目标点回原图寻找像素点
            x_old = (x - centerX) * cos(Theta) + (y - centerY) * sin(Theta) + centerX;
            y_old = -(x - centerX) * sin(Theta) + (y - centerY) * cos(Theta) + centerY;

            % 4. 使用 round 函数实现要求的 "nearest pixel"
            x_source = round(x_old);
            y_source = round(y_old);

            % 5. 边界检查：如果源像素在原图范围内，则赋值；否则保持黑色(0)
            if (x_source >= 1 && x_source <= cols && y_source >= 1 && y_source <= rows)
                Out(y, x) = In(y_source, x_source);
            end
        end
    end
end