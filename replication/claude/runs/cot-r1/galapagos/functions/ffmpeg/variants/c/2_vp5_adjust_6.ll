; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_6.c"
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
  %a = alloca i32, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, ptr %v.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 0, %2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %sub, %cond.false ]
  store i32 %cond, ptr %a, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %4
  %cmp1 = icmp slt i32 %3, %mul
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.end
  %5 = load i32, ptr %a, align 4
  br label %cond.end4

cond.false3:                                      ; preds = %cond.end
  br label %cond.end4

cond.end4:                                        ; preds = %cond.false3, %cond.true2
  %cond5 = phi i32 [ %5, %cond.true2 ], [ 0, %cond.false3 ]
  store i32 %cond5, ptr %c, align 4
  %6 = load i32, ptr %c, align 4
  %7 = load i32, ptr %t.addr, align 4
  %cmp6 = icmp sle i32 %6, %7
  br i1 %cmp6, label %cond.true7, label %cond.false8

cond.true7:                                       ; preds = %cond.end4
  %8 = load i32, ptr %c, align 4
  br label %cond.end11

cond.false8:                                      ; preds = %cond.end4
  %9 = load i32, ptr %t.addr, align 4
  %mul9 = mul nsw i32 2, %9
  %10 = load i32, ptr %c, align 4
  %sub10 = sub nsw i32 %mul9, %10
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false8, %cond.true7
  %cond12 = phi i32 [ %8, %cond.true7 ], [ %sub10, %cond.false8 ]
  store i32 %cond12, ptr %r, align 4
  %11 = load i32, ptr %v.addr, align 4
  %cmp13 = icmp sge i32 %11, 0
  br i1 %cmp13, label %cond.true14, label %cond.false15

cond.true14:                                      ; preds = %cond.end11
  %12 = load i32, ptr %r, align 4
  br label %cond.end17

cond.false15:                                     ; preds = %cond.end11
  %13 = load i32, ptr %r, align 4
  %sub16 = sub nsw i32 0, %13
  br label %cond.end17

cond.end17:                                       ; preds = %cond.false15, %cond.true14
  %cond18 = phi i32 [ %12, %cond.true14 ], [ %sub16, %cond.false15 ]
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
