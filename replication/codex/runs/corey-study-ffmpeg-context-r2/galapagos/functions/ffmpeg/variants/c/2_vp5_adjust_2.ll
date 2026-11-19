; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r2/functions/ffmpeg/variants/c/2_vp5_adjust_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r2/functions/ffmpeg/variants/c/2_vp5_adjust_2.c"
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
  %v.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %sign = alloca i32, align 4
  %a = alloca i32, align 4
  %r = alloca i32, align 4
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
  store i32 %sub, ptr %a, align 4
  %4 = load i32, ptr %t.addr, align 4
  %cmp = icmp sle i32 %4, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %5 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %5
  store i32 %mul, ptr %r, align 4
  br label %if.end11

if.else:                                          ; preds = %entry
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %t.addr, align 4
  %mul1 = mul nsw i32 2, %7
  %cmp2 = icmp sge i32 %6, %mul1
  br i1 %cmp2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  store i32 0, ptr %r, align 4
  br label %if.end10

if.else4:                                         ; preds = %if.else
  %8 = load i32, ptr %a, align 4
  %9 = load i32, ptr %t.addr, align 4
  %cmp5 = icmp sle i32 %8, %9
  br i1 %cmp5, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.else4
  %10 = load i32, ptr %a, align 4
  store i32 %10, ptr %r, align 4
  br label %if.end

if.else7:                                         ; preds = %if.else4
  %11 = load i32, ptr %t.addr, align 4
  %mul8 = mul nsw i32 2, %11
  %12 = load i32, ptr %a, align 4
  %sub9 = sub nsw i32 %mul8, %12
  store i32 %sub9, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.else7, %if.then6
  br label %if.end10

if.end10:                                         ; preds = %if.end, %if.then3
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.then
  %13 = load i32, ptr %r, align 4
  %14 = load i32, ptr %sign, align 4
  %add = add nsw i32 %13, %14
  %15 = load i32, ptr %sign, align 4
  %xor12 = xor i32 %add, %15
  ret i32 %xor12
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
