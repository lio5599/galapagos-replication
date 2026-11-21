; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-context-r3/functions/ffmpeg/variants/c/2_vp5_adjust_1.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-context-r3/functions/ffmpeg/variants/c/2_vp5_adjust_1.c"
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
  %1 = load i32, ptr %s1, align 4
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
  store i32 %cond, ptr %v.addr, align 4
  %4 = load i32, ptr %v.addr, align 4
  %5 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %5
  %cmp = icmp slt i32 %4, %mul
  br i1 %cmp, label %cond.true1, label %cond.false2

cond.true1:                                       ; preds = %cond.end
  %6 = load i32, ptr %v.addr, align 4
  br label %cond.end3

cond.false2:                                      ; preds = %cond.end
  br label %cond.end3

cond.end3:                                        ; preds = %cond.false2, %cond.true1
  %cond4 = phi i32 [ %6, %cond.true1 ], [ 0, %cond.false2 ]
  store i32 %cond4, ptr %v.addr, align 4
  %7 = load i32, ptr %t.addr, align 4
  %8 = load i32, ptr %v.addr, align 4
  %sub5 = sub nsw i32 %8, %7
  store i32 %sub5, ptr %v.addr, align 4
  %9 = load i32, ptr %v.addr, align 4
  %cmp6 = icmp slt i32 %9, 0
  br i1 %cmp6, label %cond.true7, label %cond.false9

cond.true7:                                       ; preds = %cond.end3
  %10 = load i32, ptr %v.addr, align 4
  %sub8 = sub nsw i32 0, %10
  br label %cond.end10

cond.false9:                                      ; preds = %cond.end3
  %11 = load i32, ptr %v.addr, align 4
  br label %cond.end10

cond.end10:                                       ; preds = %cond.false9, %cond.true7
  %cond11 = phi i32 [ %sub8, %cond.true7 ], [ %11, %cond.false9 ]
  store i32 %cond11, ptr %v.addr, align 4
  %12 = load i32, ptr %t.addr, align 4
  %13 = load i32, ptr %v.addr, align 4
  %sub12 = sub nsw i32 %12, %13
  store i32 %sub12, ptr %v.addr, align 4
  %14 = load i32, ptr %s1, align 4
  %tobool13 = icmp ne i32 %14, 0
  br i1 %tobool13, label %cond.true14, label %cond.false16

cond.true14:                                      ; preds = %cond.end10
  %15 = load i32, ptr %v.addr, align 4
  %sub15 = sub nsw i32 0, %15
  br label %cond.end17

cond.false16:                                     ; preds = %cond.end10
  %16 = load i32, ptr %v.addr, align 4
  br label %cond.end17

cond.end17:                                       ; preds = %cond.false16, %cond.true14
  %cond18 = phi i32 [ %sub15, %cond.true14 ], [ %16, %cond.false16 ]
  ret i32 %cond18
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
