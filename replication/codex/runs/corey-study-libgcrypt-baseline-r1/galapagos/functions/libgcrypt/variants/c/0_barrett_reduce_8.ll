; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r1/functions/libgcrypt/variants/c/0_barrett_reduce_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r1/functions/libgcrypt/variants/c/0_barrett_reduce_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %x = alloca i32, align 4
  %magnitude = alloca i32, align 4
  %r = alloca i32, align 4
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
  %4 = load i32, ptr %magnitude, align 4
  %rem = srem i32 %4, 3329
  store i32 %rem, ptr %r, align 4
  %5 = load i32, ptr %r, align 4
  %cmp2 = icmp sgt i32 %5, 1664
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %6 = load i32, ptr %r, align 4
  %sub4 = sub nsw i32 %6, 3329
  store i32 %sub4, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %7 = load i32, ptr %x, align 4
  %cmp5 = icmp slt i32 %7, 0
  br i1 %cmp5, label %cond.true7, label %cond.false9

cond.true7:                                       ; preds = %if.end
  %8 = load i32, ptr %r, align 4
  %sub8 = sub nsw i32 0, %8
  br label %cond.end10

cond.false9:                                      ; preds = %if.end
  %9 = load i32, ptr %r, align 4
  br label %cond.end10

cond.end10:                                       ; preds = %cond.false9, %cond.true7
  %cond11 = phi i32 [ %sub8, %cond.true7 ], [ %9, %cond.false9 ]
  %conv12 = trunc i32 %cond11 to i16
  ret i16 %conv12
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
