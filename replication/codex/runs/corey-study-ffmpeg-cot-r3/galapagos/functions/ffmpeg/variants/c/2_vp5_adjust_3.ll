; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/2_vp5_adjust_3.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/2_vp5_adjust_3.c"
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
  %a = alloca i32, align 4
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
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %5 = load i32, ptr %negative, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %cond.true4, label %cond.false6

cond.true4:                                       ; preds = %if.then
  %6 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %6
  %sub5 = sub nsw i32 0, %mul
  br label %cond.end8

cond.false6:                                      ; preds = %if.then
  %7 = load i32, ptr %t.addr, align 4
  %mul7 = mul nsw i32 2, %7
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false6, %cond.true4
  %cond9 = phi i32 [ %sub5, %cond.true4 ], [ %mul7, %cond.false6 ]
  store i32 %cond9, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %8 = load i32, ptr %a, align 4
  %9 = load i32, ptr %t.addr, align 4
  %mul10 = mul nsw i32 2, %9
  %cmp11 = icmp sge i32 %8, %mul10
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end
  store i32 0, ptr %retval, align 4
  br label %return

if.end14:                                         ; preds = %if.end
  %10 = load i32, ptr %a, align 4
  %11 = load i32, ptr %t.addr, align 4
  %cmp15 = icmp sgt i32 %10, %11
  br i1 %cmp15, label %if.then17, label %if.end20

if.then17:                                        ; preds = %if.end14
  %12 = load i32, ptr %t.addr, align 4
  %13 = load i32, ptr %a, align 4
  %14 = load i32, ptr %t.addr, align 4
  %sub18 = sub nsw i32 %13, %14
  %sub19 = sub nsw i32 %12, %sub18
  store i32 %sub19, ptr %a, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then17, %if.end14
  %15 = load i32, ptr %negative, align 4
  %tobool21 = icmp ne i32 %15, 0
  br i1 %tobool21, label %cond.true22, label %cond.false24

cond.true22:                                      ; preds = %if.end20
  %16 = load i32, ptr %a, align 4
  %sub23 = sub nsw i32 0, %16
  br label %cond.end25

cond.false24:                                     ; preds = %if.end20
  %17 = load i32, ptr %a, align 4
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false24, %cond.true22
  %cond26 = phi i32 [ %sub23, %cond.true22 ], [ %17, %cond.false24 ]
  store i32 %cond26, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end25, %if.then13, %cond.end8
  %18 = load i32, ptr %retval, align 4
  ret i32 %18
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
