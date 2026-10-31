; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_1.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @weight(i32 noundef 0, i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @weight(i32 noundef %i, i32 noundef %blen, i32 noundef %offset) #0 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %blen.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  %two = alloca i32, align 4
  %last = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  store i32 %blen, ptr %blen.addr, align 4
  store i32 %offset, ptr %offset.addr, align 4
  %0 = load i32, ptr %offset.addr, align 4
  %mul = mul nsw i32 2, %0
  store i32 %mul, ptr %two, align 4
  %1 = load i32, ptr %blen.addr, align 4
  %sub = sub nsw i32 %1, 1
  store i32 %sub, ptr %last, align 4
  %2 = load i32, ptr %i.addr, align 4
  %3 = load i32, ptr %two, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, ptr %i.addr, align 4
  %5 = load i32, ptr %last, align 4
  %6 = load i32, ptr %two, align 4
  %sub1 = sub nsw i32 %5, %6
  %cmp2 = icmp sgt i32 %4, %sub1
  br i1 %cmp2, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  store i32 8, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %7 = load i32, ptr %i.addr, align 4
  %8 = load i32, ptr %two, align 4
  %cmp3 = icmp slt i32 %7, %8
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %9 = load i32, ptr %i.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %10 = load i32, ptr %last, align 4
  %11 = load i32, ptr %i.addr, align 4
  %sub4 = sub nsw i32 %10, %11
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %9, %cond.true ], [ %sub4, %cond.false ]
  store i32 %cond, ptr %d, align 4
  %12 = load i32, ptr %offset.addr, align 4
  %cmp5 = icmp eq i32 %12, 1
  br i1 %cmp5, label %cond.true6, label %cond.false9

cond.true6:                                       ; preds = %cond.end
  %13 = load i32, ptr %d, align 4
  %cmp7 = icmp ne i32 %13, 0
  %14 = zext i1 %cmp7 to i64
  %cond8 = select i1 %cmp7, i32 5, i32 3
  br label %cond.end14

cond.false9:                                      ; preds = %cond.end
  %15 = load i32, ptr %d, align 4
  %mul10 = mul nsw i32 6, %15
  %16 = load i32, ptr %offset.addr, align 4
  %add = add nsw i32 %mul10, %16
  %sub11 = sub nsw i32 %add, 1
  %17 = load i32, ptr %two, align 4
  %sub12 = sub nsw i32 %17, 1
  %div = sdiv i32 %sub11, %sub12
  %add13 = add nsw i32 1, %div
  br label %cond.end14

cond.end14:                                       ; preds = %cond.false9, %cond.true6
  %cond15 = phi i32 [ %cond8, %cond.true6 ], [ %add13, %cond.false9 ]
  store i32 %cond15, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end14, %if.then
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
