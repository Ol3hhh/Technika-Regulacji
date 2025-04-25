model = 'regulacja_PI_model';
load_system(model);

% Define the Kp and Ki ranges (adjust resolution as needed)
Kp_vals = linspace(0, 1, 50);     % 50 steps from 0 to 1
Ki_vals = linspace(0, 0.1, 50);   % 50 steps from 0 to 0.1

% Initialize best result variables
best_iae = Inf;
best_Kp = 0;
best_Ki = 0;

% Brute-force grid search
for Kp = Kp_vals
    for Ki = Ki_vals
        try
            iae = simulate_iae(model, Kp, Ki);
            if iae < best_iae
                best_iae = iae;
                best_Kp = Kp;
                best_Ki = Ki;
            end
        catch ME
            fprintf('Error at Kp = %.4f, Ki = %.4f: %s\n', Kp, Ki, ME.message);
        end
    end
end

% Print the best result
fprintf('\n✅ Best values found:\nKp = %.4f\nKi = %.4f\nIAE = %.4f\n', best_Kp, best_Ki, best_iae);


% ==== Simulation Function ====
function iae = simulate_iae(model, Kp, Ki)
    % Set the PI controller parameters in the Simulink model
    set_param([model '/PID Controller'], 'P', num2str(Kp), 'I', num2str(Ki));
    
    % Run the simulation
    simOut = sim(model, 'ReturnWorkspaceOutputs', 'on');
    
    % Extract the integrated absolute error (assumes integrator output is iae)
    iae_data = simOut.get('iae');
    
    % Use the final value (assuming output is from integrator block)
    if isstruct(iae_data)
        % If iae is a struct (like timeseries), get the final value
        iae = iae_data.signals.values(end);
    else
        % Otherwise assume it's just an array
        iae = iae_data(end);
    end
end