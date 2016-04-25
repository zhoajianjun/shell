Name:	MPlayer	
Version:1.1.1	
Release:	11%{?dist}
Summary:	compiled from MPlayer 1.1.1

Group:		System Environment/Daemons
License:	GPL
URL:		www.mplayer.org
Source0:	MPlayer-1.1.1.tar.gz
Source1:         default
BuildRoot:	%(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

#BuildRequires:	gcc
AutoReqProv: 	no
#Requires: 


%description
It is a MPlayer


%prep
%setup -q
%build
 ./configure --enable-gui --codecsdir=/usr/local/lib/codecs --enable-menu --prefix=/opt/bqvision --language=zh_CN,cn --enable-x11

%install
rm -rf %{buildroot}
make install DESTDIR=%{buildroot}
#mkdir -p %{buildroot}/opt/bqvision/share/mplayer/skins/default
cp -r   %{SOURCE1}  %{buildroot}/opt/bqvision/share/mplayer/skins/

%clean
rm -rf %{buildroot}


%files
/opt/*
%defattr(-,root,root,-)

%doc
%post
cp /opt/bqvision/share/applications/mplayer.desktop  /usr/share/applications/



%changelog
* Thu Jul 9 2015 zhaojianjun<931574619@qq.com>-1.1.1-11
-Initial version
