; ModuleID = 'exustl.cpp'
source_filename = "exustl.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.ustl::vector" = type { %"class.ustl::memblock" }
%"class.ustl::memblock" = type { %"class.ustl::memlink", i64 }
%"class.ustl::memlink" = type { %"class.ustl::cmemlink" }
%"class.ustl::cmemlink" = type { i32 (...)**, i8*, i64 }

$_ZN4ustl6vectorIiE9push_backEOi = comdat any

$_ZN4ustl4moveIRiEEONS_2tm15RemoveReferenceIT_E6ResultEOS4_ = comdat any

@.str = private unnamed_addr constant [7 x i8] c"Check\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"C++11 lol\00", align 1

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main() #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca i32, align 4
  %2 = alloca %"class.ustl::vector", align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*
  %5 = alloca i32
  store i32 0, i32* %1, align 4
  call void @_ZN4ustl6vectorIiEC1Ev(%"class.ustl::vector"* %2)
  store i32 1, i32* %3, align 4
  invoke void @_ZN4ustl6vectorIiE9push_backEOi(%"class.ustl::vector"* %2, i32* dereferenceable(4) %3)
          to label %6 unwind label %10

; <label>:6:                                      ; preds = %0
  %7 = invoke i32 @puts(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
          to label %8 unwind label %10

; <label>:8:                                      ; preds = %6
  store i32 1, i32* %1, align 4
  call void @_ZN4ustl6vectorIiED1Ev(%"class.ustl::vector"* %2) #5
  %9 = load i32, i32* %1, align 4
  ret i32 %9

; <label>:10:                                     ; preds = %6, %0
  %11 = landingpad { i8*, i32 }
          cleanup
  %12 = extractvalue { i8*, i32 } %11, 0
  store i8* %12, i8** %4, align 8
  %13 = extractvalue { i8*, i32 } %11, 1
  store i32 %13, i32* %5, align 4
  call void @_ZN4ustl6vectorIiED1Ev(%"class.ustl::vector"* %2) #5
  br label %14

; <label>:14:                                     ; preds = %10
  %15 = load i8*, i8** %4, align 8
  %16 = load i32, i32* %5, align 4
  %17 = insertvalue { i8*, i32 } undef, i8* %15, 0
  %18 = insertvalue { i8*, i32 } %17, i32 %16, 1
  resume { i8*, i32 } %18
}

declare void @_ZN4ustl6vectorIiEC1Ev(%"class.ustl::vector"*) unnamed_addr #1

; Function Attrs: noinline optnone uwtable
define linkonce_odr void @_ZN4ustl6vectorIiE9push_backEOi(%"class.ustl::vector"*, i32* dereferenceable(4)) #2 comdat align 2 {
  %3 = alloca %"class.ustl::vector"*, align 8
  %4 = alloca i32*, align 8
  store %"class.ustl::vector"* %0, %"class.ustl::vector"** %3, align 8
  store i32* %1, i32** %4, align 8
  %5 = load %"class.ustl::vector"*, %"class.ustl::vector"** %3, align 8
  %6 = load i32*, i32** %4, align 8
  %7 = call dereferenceable(4) i32* @_ZN4ustl4moveIRiEEONS_2tm15RemoveReferenceIT_E6ResultEOS4_(i32* dereferenceable(4) %6) #5
  call void @_ZN4ustl6vectorIiE12emplace_backIJiEEEvDpOT_(%"class.ustl::vector"* %5, i32* dereferenceable(4) %7)
  %8 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0))
  ret void
}

declare i32 @__gxx_personality_v0(...)

declare i32 @puts(i8*) #1

; Function Attrs: nounwind
declare void @_ZN4ustl6vectorIiED1Ev(%"class.ustl::vector"*) unnamed_addr #3

declare void @_ZN4ustl6vectorIiE12emplace_backIJiEEEvDpOT_(%"class.ustl::vector"*, i32* dereferenceable(4)) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dereferenceable(4) i32* @_ZN4ustl4moveIRiEEONS_2tm15RemoveReferenceIT_E6ResultEOS4_(i32* dereferenceable(4)) #4 comdat {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  ret i32* %3
}

attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
