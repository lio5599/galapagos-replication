; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/2_vp5_adjust_5.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/2_vp5_adjust_5.c"
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
  %negative = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, ptr %negative, align 4
  %1 = load i32, ptr %v.addr, align 4
  store i32 %1, ptr %r, align 4
  %2 = load i32, ptr %negative, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %r, align 4
  %sub = sub nsw i32 0, %3
  store i32 %sub, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, ptr %r, align 4
  %5 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %5
  %cmp1 = icmp sge i32 %4, %mul
  br i1 %cmp1, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 0, ptr %r, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %6 = load i32, ptr %t.addr, align 4
  %7 = load i32, ptr %r, align 4
  %sub5 = sub nsw i32 %7, %6
  store i32 %sub5, ptr %r, align 4
  %8 = load i32, ptr %r, align 4
  %cmp6 = icmp slt i32 %8, 0
  br i1 %cmp6, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end4
  %9 = load i32, ptr %r, align 4
  %sub9 = sub nsw i32 0, %9
  store i32 %sub9, ptr %r, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end4
  %10 = load i32, ptr %t.addr, align 4
  %11 = load i32, ptr %r, align 4
  %sub11 = sub nsw i32 %10, %11
  store i32 %sub11, ptr %r, align 4
  %12 = load i32, ptr %negative, align 4
  %tobool12 = icmp ne i32 %12, 0
  br i1 %tobool12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end10
  %13 = load i32, ptr %r, align 4
  %sub14 = sub nsw i32 0, %13
  store i32 %sub14, ptr %r, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end10
  %14 = load i32, ptr %r, align 4
  ret i32 %14
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
