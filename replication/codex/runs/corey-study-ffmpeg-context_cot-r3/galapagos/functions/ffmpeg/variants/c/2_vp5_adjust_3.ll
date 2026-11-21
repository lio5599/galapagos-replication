; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-context_cot-r3/functions/ffmpeg/variants/c/2_vp5_adjust_3.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-context_cot-r3/functions/ffmpeg/variants/c/2_vp5_adjust_3.c"
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
  %s1 = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %shr = ashr i32 %0, 31
  store i32 %shr, ptr %s1, align 4
  %1 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 0, %2
  store i32 %sub, ptr %v.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, ptr %v.addr, align 4
  %4 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %4
  %cmp1 = icmp slt i32 %3, %mul
  %conv = zext i1 %cmp1 to i32
  %5 = load i32, ptr %v.addr, align 4
  %mul2 = mul nsw i32 %5, %conv
  store i32 %mul2, ptr %v.addr, align 4
  %6 = load i32, ptr %t.addr, align 4
  %7 = load i32, ptr %v.addr, align 4
  %sub3 = sub nsw i32 %7, %6
  store i32 %sub3, ptr %v.addr, align 4
  %8 = load i32, ptr %v.addr, align 4
  %cmp4 = icmp slt i32 %8, 0
  br i1 %cmp4, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end
  %9 = load i32, ptr %v.addr, align 4
  %sub7 = sub nsw i32 0, %9
  store i32 %sub7, ptr %v.addr, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end
  %10 = load i32, ptr %t.addr, align 4
  %11 = load i32, ptr %v.addr, align 4
  %sub9 = sub nsw i32 %10, %11
  store i32 %sub9, ptr %v.addr, align 4
  %12 = load i32, ptr %s1, align 4
  %13 = load i32, ptr %v.addr, align 4
  %add = add nsw i32 %13, %12
  store i32 %add, ptr %v.addr, align 4
  %14 = load i32, ptr %s1, align 4
  %15 = load i32, ptr %v.addr, align 4
  %xor = xor i32 %15, %14
  store i32 %xor, ptr %v.addr, align 4
  %16 = load i32, ptr %v.addr, align 4
  ret i32 %16
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
