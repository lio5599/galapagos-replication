; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-context-r3/functions/ffmpeg/variants/c/2_vp5_adjust_8.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-context-r3/functions/ffmpeg/variants/c/2_vp5_adjust_8.c"
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
  %negative = alloca i32, align 4
  %delta = alloca i32, align 4
  %s2 = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, ptr %negative, align 4
  %1 = load i32, ptr %negative, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

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
  %conv2 = zext i1 %cmp1 to i32
  %sub3 = sub nsw i32 0, %conv2
  %5 = load i32, ptr %v.addr, align 4
  %and = and i32 %5, %sub3
  store i32 %and, ptr %v.addr, align 4
  %6 = load i32, ptr %v.addr, align 4
  %7 = load i32, ptr %t.addr, align 4
  %sub4 = sub nsw i32 %6, %7
  store i32 %sub4, ptr %delta, align 4
  %8 = load i32, ptr %delta, align 4
  %shr = ashr i32 %8, 31
  store i32 %shr, ptr %s2, align 4
  %9 = load i32, ptr %t.addr, align 4
  %10 = load i32, ptr %delta, align 4
  %11 = load i32, ptr %s2, align 4
  %xor = xor i32 %10, %11
  %12 = load i32, ptr %s2, align 4
  %sub5 = sub nsw i32 %xor, %12
  %sub6 = sub nsw i32 %9, %sub5
  store i32 %sub6, ptr %v.addr, align 4
  %13 = load i32, ptr %negative, align 4
  %tobool7 = icmp ne i32 %13, 0
  br i1 %tobool7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end
  %14 = load i32, ptr %v.addr, align 4
  %sub9 = sub nsw i32 0, %14
  store i32 %sub9, ptr %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end
  %15 = load i32, ptr %v.addr, align 4
  store i32 %15, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end10, %if.then8
  %16 = load i32, ptr %retval, align 4
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
