function jsonobject = plotd3(varargin)
%d3PLOTTER
narginchk(1,inf);

[args,~] = parseparams(varargin);
nargs = length(args);
if nargs < 1
    error(message('MATLAB:narginchk:notEnoughInputs'));
elseif nargs > 10
    error(message('MATLAB:narginchk:tooManyInputs'));
end

j=1;
i=1;
w=struct();
while(i<=length(args)/2)
w.(['x' num2str(i)]) = args{1,j};
w.(['y' num2str(i)]) = args{1,j+1};
j=j+2;
i=i+1;
end

jsonobject =  jsonencode(w);
path = fullfile('C:','users','rphilip','Hackathon');
htmlFile = fullfile('C:','users','rphilip','Hackathon','template.html');
newfile = strcat(path , '\Temp_', 'template.html');
htmldata = fileread(htmlFile);
searchdata = 'var jsoninput';
repldata= "var jsoninput = "+ string(jsonobject);
new_claim = strrep(htmldata, searchdata, repldata);
fid = fopen(newfile,'w+');
fprintf(fid,'%s',new_claim);
c = onCleanup(@()fclose(fid));
web(newfile);
end


