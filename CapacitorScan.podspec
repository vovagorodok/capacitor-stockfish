require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name = 'CapacitorScan'
  s.version = package['version']
  s.summary = package['description']
  s.license = package['license']
  s.homepage = package['repository']['url']
  s.author = package['author']
  s.platform = :ios
  s.source = { :git => package['repository']['url'], :tag => s.version.to_s }
  s.source_files = 'ios/Plugin/**/*.{swift,h,hpp,m,c,cc,mm,cpp}', 'scan/src/**/*.{h,hpp,cpp}', 'lib/*.h'
  s.public_header_files = 'ios/Plugin/**/*.{h,hpp}'
  s.exclude_files = 'scan/src/Makefile'
  s.ios.deployment_target  = '12.0'
  s.dependency 'Capacitor'
  s.swift_version = '5.1'
  s.compiler_flags = '-fmodules -fcxx-modules'
  s.xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'OTHER_CPLUSPLUSFLAGS' => '-fexceptions -std=c++14 -DHAVE_PTHREAD=1 -O3',
    'OTHER_LDFLAGS' => '-fexceptions -std=c++14 -DHAVE_PTHREAD=1 -O3'
  }
end
