% Composite Floquet Scattering Matrix (CFSM) Circuit Simulator
%
% Copyright (C) 2017  Mykhailo Tymchenko
% Email: mtymchenko@utexas.edu
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.


function out = get_voltage(crt, compid, port, t)
voltage_spectrum = get_voltage_spectrum(crt, compid, port);
out = zeros(1, numel(t));
for ifreq = 1:numel(crt.freq)
    out = out + crt.compute_IFT(voltage_spectrum(:,ifreq), t).*exp(1j*2*pi*crt.freq(ifreq)*t);
end
end