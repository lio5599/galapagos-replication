; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r1/functions/ffmpeg/variants/c/2_vp5_adjust_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r1/functions/ffmpeg/variants/c/2_vp5_adjust_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @vp5_adjust(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @vp5_adjust(i32 noundef %v, i32 noundef %t) #0 {
entry:
  %retval = alloca i32, align 4
  %v.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %sign = alloca i32, align 4
  %magnitude = alloca i32, align 4
  %twice = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %shr = ashr i32 %0, 31
  store i32 %shr, ptr %sign, align 4
  %1 = load i32, ptr %v.addr, align 4
  %2 = load i32, ptr %sign, align 4
  %xor = xor i32 %1, %2
  %3 = load i32, ptr %sign, align 4
  %sub = sub nsw i32 %xor, %3
  store i32 %sub, ptr %magnitude, align 4
  %4 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %4
  store i32 %mul, ptr %twice, align 4
  %5 = load i32, ptr %magnitude, align 4
  %6 = load i32, ptr %twice, align 4
  %cmp = icmp slt i32 %5, %6
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %7 = load i32, ptr %magnitude, align 4
  %8 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp slt i32 %7, %8
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %9 = load i32, ptr %magnitude, align 4
  %10 = load i32, ptr %sign, align 4
  %add = add nsw i32 %9, %10
  %11 = load i32, ptr %sign, align 4
  %xor3 = xor i32 %add, %11
  store i32 %xor3, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %12 = load i32, ptr %twice, align 4
  %13 = load i32, ptr %magnitude, align 4
  %sub4 = sub nsw i32 %12, %13
  %14 = load i32, ptr %sign, align 4
  %add5 = add nsw i32 %sub4, %14
  %15 = load i32, ptr %sign, align 4
  %xor6 = xor i32 %add5, %15
  store i32 %xor6, ptr %retval, align 4
  br label %return

if.end7:                                          ; preds = %entry
  %16 = load i32, ptr %t.addr, align 4
  %cmp8 = icmp slt i32 %16, 0
  br i1 %cmp8, label %if.then9, label %if.end12

if.then9:                                         ; preds = %if.end7
  %17 = load i32, ptr %twice, align 4
  %18 = load i32, ptr %sign, align 4
  %add10 = add nsw i32 %17, %18
  %19 = load i32, ptr %sign, align 4
  %xor11 = xor i32 %add10, %19
  store i32 %xor11, ptr %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end7
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end12, %if.then9, %if.end, %if.then2
  %20 = load i32, ptr %retval, align 4
  ret i32 %20
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
