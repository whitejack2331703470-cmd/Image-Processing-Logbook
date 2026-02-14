function [Out] = Shear(In, Xshear, Yshear)
    % Get dimensions of the original image
    [h, w] = size(In); 
    
    % Initialize a black image of the same size
    Out = zeros(h, w); 
    
    % Define the center of the image (pivot point)
    xc = w / 2;
    yc = h / 2;
    % Define the Forward Shear Matrix
    M = [1 Xshear; Yshear 1]; 
    
    % Calculate the Inverse Matrix for reverse mapping
    T_inv = inv(M);

    for y = 1:h
        for x = 1:w
            % 1. Shift coordinate so the center is (0,0)
            xt = x - xc;
            yt = y - yc;
            
            % 2. Apply inverse transform to find source coordinates
            % Multiply matrix T_inv by the coordinate vector [xt; yt]
            src_coords = T_inv * [xt; yt];
            
            % 3. Shift back to MATLAB's 1-based pixel coordinates
            % and use round() for 'nearest pixel' as required
            xs = round(src_coords(1) + xc);
            ys = round(src_coords(2) + yc);
            
            % 4. Boundary Check: Only paint if the source pixel exists
            if (xs >= 1 && xs <= w && ys >= 1 && ys <= h)
                Out(y, x) = In(ys, xs);
            else
                Out(y, x) = 0; % Paint black if outside the original image
            end
        end
    end
end