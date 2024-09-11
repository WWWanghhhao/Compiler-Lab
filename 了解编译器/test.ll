; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@r = dso_local global double 4.500000e+00, align 8
@.str = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"area is %lf\0A\00", align 1
@.str.2 = private unnamed_addr constant [44 x i8] c"10 squared is %d and its square root is %f\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"wrong answer\0A\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"correct answer\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @calculate_area(double noundef %0) #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8
  %3 = load double, ptr %2, align 8
  %4 = load double, ptr %2, align 8
  %5 = fmul double %3, %4
  %6 = fmul double 0x400921FB54442D18, %5
  ret double %6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef @r)
  %6 = load double, ptr @r, align 8
  %7 = call double @calculate_area(double noundef %6)
  store double %7, ptr %2, align 8
  %8 = load double, ptr %2, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %8)
  %10 = load double, ptr @r, align 8
  %11 = fadd double %10, 1.000000e+00
  store double %11, ptr @r, align 8
  store i32 0, ptr %3, align 4
  store i32 1, ptr %4, align 4
  br label %12

12:                                               ; preds = %19, %0
  %13 = load i32, ptr %4, align 4
  %14 = icmp sle i32 %13, 100
  br i1 %14, label %15, label %22

15:                                               ; preds = %12
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %3, align 4
  br label %19

19:                                               ; preds = %15
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %4, align 4
  br label %12, !llvm.loop !6

22:                                               ; preds = %12
  %23 = call double @sqrt(double noundef 1.000000e+01) #3
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 100, double noundef %23)
  %25 = load i32, ptr %3, align 4
  switch i32 %25, label %30 [
    i32 5000, label %26
    i32 5050, label %28
  ]

26:                                               ; preds = %22
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %30

28:                                               ; preds = %22
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %30

30:                                               ; preds = %22, %28, %26
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare double @sqrt(double noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
