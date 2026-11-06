; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_5.c"
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
  %region = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 0, %1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %2, %cond.false ]
  store i32 %cond, ptr %a, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %4
  %cmp1 = icmp sge i32 %3, %mul
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.end
  br label %cond.end5

cond.false3:                                      ; preds = %cond.end
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %t.addr, align 4
  %cmp4 = icmp sgt i32 %5, %6
  %conv = zext i1 %cmp4 to i32
  br label %cond.end5

cond.end5:                                        ; preds = %cond.false3, %cond.true2
  %cond6 = phi i32 [ 2, %cond.true2 ], [ %conv, %cond.false3 ]
  store i32 %cond6, ptr %region, align 4
  %7 = load i32, ptr %region, align 4
  switch i32 %7, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb7
  ]

sw.bb:                                            ; preds = %cond.end5
  %8 = load i32, ptr %a, align 4
  store i32 %8, ptr %r, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %cond.end5
  %9 = load i32, ptr %t.addr, align 4
  %mul8 = mul nsw i32 2, %9
  %10 = load i32, ptr %a, align 4
  %sub9 = sub nsw i32 %mul8, %10
  store i32 %sub9, ptr %r, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %cond.end5
  %11 = load i32, ptr %t.addr, align 4
  %cmp10 = icmp slt i32 %11, 0
  br i1 %cmp10, label %cond.true12, label %cond.false13

cond.true12:                                      ; preds = %sw.default
  %12 = load i32, ptr %t.addr, align 4
  %13 = load i32, ptr %t.addr, align 4
  %add = add nsw i32 %12, %13
  br label %cond.end14

cond.false13:                                     ; preds = %sw.default
  br label %cond.end14

cond.end14:                                       ; preds = %cond.false13, %cond.true12
  %cond15 = phi i32 [ %add, %cond.true12 ], [ 0, %cond.false13 ]
  store i32 %cond15, ptr %r, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %cond.end14, %sw.bb7, %sw.bb
  %14 = load i32, ptr %v.addr, align 4
  %cmp16 = icmp slt i32 %14, 0
  br i1 %cmp16, label %cond.true18, label %cond.false20

cond.true18:                                      ; preds = %sw.epilog
  %15 = load i32, ptr %r, align 4
  %sub19 = sub nsw i32 0, %15
  br label %cond.end21

cond.false20:                                     ; preds = %sw.epilog
  %16 = load i32, ptr %r, align 4
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true18
  %cond22 = phi i32 [ %sub19, %cond.true18 ], [ %16, %cond.false20 ]
  ret i32 %cond22
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
