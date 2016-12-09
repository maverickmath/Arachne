function DeployMatFile(fileName)
%% Deploy a MAT-file (input.mat or image.mat) to remote cluster or HPC kernel directory
%  fileName - the file name without the extension

    global remoteHPC zipMatFiles
    
    if ispc && ~remoteHPC
        % Copy the MAT-file generated by Matlab host to HPC kernel directory
        disp(['Deploying ', fileName, ' MAT-file ...']);
        command = ['call Core\scripts\win-win\copy_input.bat ', fileName];
        system(command);
    elseif ispc && remoteHPC
        % Upload the MAT-file generated by Matlab host to the head node of HPC cluster
        if zipMatFiles
            disp(['Zipping, uploading, and unzipping ', fileName, ' MAT-file ...']);
        else
            disp(['Uploading ', fileName, ' MAT-file ...']);
        end
        command = sprintf('call Core\\scripts\\win-lin\\upload.bat %i %s', zipMatFiles, fileName);
        system(command);
    elseif isunix && ~remoteHPC
        % Copy the MAT-file generated by Matlab host to HPC kernel directory
        disp(['Deploying ', fileName, ' MAT-file ...']);
        command = ['bash Core/scripts/lin-lin/copy_input.sh ', fileName];
        system(command);
    elseif isunix && remoteHPC
        error('Not supported mode: isunix && remoteHPC');
    else
        error('Unknown OS');
    end
    
end