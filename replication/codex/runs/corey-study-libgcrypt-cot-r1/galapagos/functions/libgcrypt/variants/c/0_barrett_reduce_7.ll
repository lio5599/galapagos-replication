; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r1/functions/libgcrypt/variants/c/0_barrett_reduce_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r1/functions/libgcrypt/variants/c/0_barrett_reduce_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %x = alloca i32, align 4
  %magnitude = alloca i32, align 4
  %r = alloca i32, align 4
  %centered = alloca i32, align 4
  %i = alloca i32, align 4
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i32
  store i32 %conv, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32, ptr %x, align 4
  %sub = sub nsw i32 0, %2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, ptr %x, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %3, %cond.false ]
  store i32 %cond, ptr %magnitude, align 4
  store i32 0, ptr %r, align 4
  store i32 15, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %4 = load i32, ptr %i, align 4
  %cmp2 = icmp sge i32 %4, 0
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32, ptr %r, align 4
  %shl = shl i32 %5, 1
  %6 = load i32, ptr %magnitude, align 4
  %7 = load i32, ptr %i, align 4
  %shr = lshr i32 %6, %7
  %and = and i32 %shr, 1
  %or = or i32 %shl, %and
  store i32 %or, ptr %r, align 4
  %8 = load i32, ptr %r, align 4
  %cmp4 = icmp uge i32 %8, 3329
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %9 = load i32, ptr %r, align 4
  %sub6 = sub i32 %9, 3329
  store i32 %sub6, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, ptr %i, align 4
  %dec = add nsw i32 %10, -1
  store i32 %dec, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %r, align 4
  store i32 %11, ptr %centered, align 4
  %12 = load i32, ptr %centered, align 4
  %cmp7 = icmp sgt i32 %12, 1664
  br i1 %cmp7, label %if.then9, label %if.end11

if.then9:                                         ; preds = %for.end
  %13 = load i32, ptr %centered, align 4
  %sub10 = sub nsw i32 %13, 3329
  store i32 %sub10, ptr %centered, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %for.end
  %14 = load i32, ptr %x, align 4
  %cmp12 = icmp slt i32 %14, 0
  br i1 %cmp12, label %cond.true14, label %cond.false16

cond.true14:                                      ; preds = %if.end11
  %15 = load i32, ptr %centered, align 4
  %sub15 = sub nsw i32 0, %15
  br label %cond.end17

cond.false16:                                     ; preds = %if.end11
  %16 = load i32, ptr %centered, align 4
  br label %cond.end17

cond.end17:                                       ; preds = %cond.false16, %cond.true14
  %cond18 = phi i32 [ %sub15, %cond.true14 ], [ %16, %cond.false16 ]
  %conv19 = trunc i32 %cond18 to i16
  ret i16 %conv19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call signext i16 @barrett_reduce(i16 noundef signext 0)
  ret i32 0
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
