function ipts=SIFT(img,Options)
% Process inputs
defaultoptions=struct('tresh',0.0002,'octaves',5,'init_sample',2,'upright',false,'extended',false,'verbose',false);
if(~exist('Options','var')), 
    Options=defaultoptions; 
else
    tags = fieldnames(defaultoptions);
    for i=1:length(tags)
         if(~isfield(Options,tags{i})),  Options.(tags{i})=defaultoptions.(tags{i}); end
    end
    if(length(tags)~=length(fieldnames(Options))), 
        warning('register_volumes:unknownoption','unknown options found');
    end
end

% Create Integral Image
iimg=IntegralImage_IntegralImage(img);

% Extract the interest points
FastHessianData.thresh = Options.tresh;
FastHessianData.octaves = Options.octaves;
FastHessianData.init_sample = Options.init_sample;
FastHessianData.img = iimg;
ipts = FastHessian_getIpoints(FastHessianData,Options.verbose);

% Describe the interest points
if(~isempty(ipts))
    ipts = SurfDescriptor_DecribeInterestPoints(ipts,Options.upright, Options.extended, iimg, Options.verbose);
end

