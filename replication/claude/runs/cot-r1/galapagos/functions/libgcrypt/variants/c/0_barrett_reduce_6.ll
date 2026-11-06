; ModuleID = '/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/0_barrett_reduce_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libgcrypt/variants/c/0_barrett_reduce_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %y = alloca double, align 8
  %t = alloca i32, align 4
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i32
  %conv1 = sitofp i32 %conv to double
  %1 = call double @llvm.fmuladd.f64(double 2.015900e+04, double %conv1, double 0x4180000000000000)
  %div = fdiv double %1, 0x4190000000000000
  store double %div, ptr %y, align 8
  %2 = load double, ptr %y, align 8
  %conv2 = fptosi double %2 to i32
  store i32 %conv2, ptr %t, align 4
  %3 = load i32, ptr %t, align 4
  %conv3 = sitofp i32 %3 to double
  %4 = load double, ptr %y, align 8
  %cmp = fcmp ogt double %conv3, %4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load i32, ptr %t, align 4
  %dec = add nsw i32 %5, -1
  store i32 %dec, ptr %t, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i16, ptr %a.addr, align 2
  %conv5 = sext i16 %6 to i32
  %7 = load i32, ptr %t, align 4
  %mul = mul nsw i32 %7, 3329
  %sub = sub nsw i32 %conv5, %mul
  %conv6 = trunc i32 %sub to i16
  ret i16 %conv6
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call signext i16 @barrett_reduce(i16 noundef signext 0)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
