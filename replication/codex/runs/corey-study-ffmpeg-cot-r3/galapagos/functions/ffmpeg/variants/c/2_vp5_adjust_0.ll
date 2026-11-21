; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/2_vp5_adjust_0.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/2_vp5_adjust_0.c"
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
  %a = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, ptr %negative, align 4
  %1 = load i32, ptr %negative, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 0, %2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, ptr %v.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %3, %cond.false ]
  store i32 %cond, ptr %a, align 4
  %4 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp sle i32 %4, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %5 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %5
  store i32 %mul, ptr %r, align 4
  br label %if.end15

if.else:                                          ; preds = %cond.end
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %t.addr, align 4
  %cmp3 = icmp sle i32 %6, %7
  br i1 %cmp3, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.else
  %8 = load i32, ptr %a, align 4
  store i32 %8, ptr %r, align 4
  br label %if.end14

if.else6:                                         ; preds = %if.else
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %t.addr, align 4
  %mul7 = mul nsw i32 2, %10
  %cmp8 = icmp slt i32 %9, %mul7
  br i1 %cmp8, label %if.then10, label %if.else13

if.then10:                                        ; preds = %if.else6
  %11 = load i32, ptr %t.addr, align 4
  %mul11 = mul nsw i32 2, %11
  %12 = load i32, ptr %a, align 4
  %sub12 = sub nsw i32 %mul11, %12
  store i32 %sub12, ptr %r, align 4
  br label %if.end

if.else13:                                        ; preds = %if.else6
  store i32 0, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.else13, %if.then10
  br label %if.end14

if.end14:                                         ; preds = %if.end, %if.then5
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then
  %13 = load i32, ptr %negative, align 4
  %tobool16 = icmp ne i32 %13, 0
  br i1 %tobool16, label %cond.true17, label %cond.false19

cond.true17:                                      ; preds = %if.end15
  %14 = load i32, ptr %r, align 4
  %sub18 = sub nsw i32 0, %14
  br label %cond.end20

cond.false19:                                     ; preds = %if.end15
  %15 = load i32, ptr %r, align 4
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false19, %cond.true17
  %cond21 = phi i32 [ %sub18, %cond.true17 ], [ %15, %cond.false19 ]
  ret i32 %cond21
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
