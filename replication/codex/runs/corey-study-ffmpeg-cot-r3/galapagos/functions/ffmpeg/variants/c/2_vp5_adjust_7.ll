; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/2_vp5_adjust_7.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/2_vp5_adjust_7.c"
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
  br label %if.end

if.else:                                          ; preds = %cond.end
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %t.addr, align 4
  %cmp3 = icmp sgt i32 %6, %7
  %conv4 = zext i1 %cmp3 to i32
  %8 = load i32, ptr %a, align 4
  %9 = load i32, ptr %t.addr, align 4
  %mul5 = mul nsw i32 2, %9
  %cmp6 = icmp sge i32 %8, %mul5
  %conv7 = zext i1 %cmp6 to i32
  %add = add nsw i32 %conv4, %conv7
  switch i32 %add, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb8
  ]

sw.bb:                                            ; preds = %if.else
  %10 = load i32, ptr %a, align 4
  store i32 %10, ptr %r, align 4
  br label %sw.epilog

sw.bb8:                                           ; preds = %if.else
  %11 = load i32, ptr %t.addr, align 4
  %mul9 = mul nsw i32 2, %11
  %12 = load i32, ptr %a, align 4
  %sub10 = sub nsw i32 %mul9, %12
  store i32 %sub10, ptr %r, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %if.else
  store i32 0, ptr %r, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb8, %sw.bb
  br label %if.end

if.end:                                           ; preds = %sw.epilog, %if.then
  %13 = load i32, ptr %negative, align 4
  %tobool11 = icmp ne i32 %13, 0
  br i1 %tobool11, label %cond.true12, label %cond.false14

cond.true12:                                      ; preds = %if.end
  %14 = load i32, ptr %r, align 4
  %sub13 = sub nsw i32 0, %14
  br label %cond.end15

cond.false14:                                     ; preds = %if.end
  %15 = load i32, ptr %r, align 4
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.true12
  %cond16 = phi i32 [ %sub13, %cond.true12 ], [ %15, %cond.false14 ]
  ret i32 %cond16
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
