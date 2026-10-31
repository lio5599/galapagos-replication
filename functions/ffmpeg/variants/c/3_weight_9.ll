; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/3_weight_9.c"
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
  %d = alloca i32, align 4
  %w = alloca i32, align 4
  %q = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  store i32 %blen, ptr %blen.addr, align 4
  store i32 %offset, ptr %offset.addr, align 4
  %0 = load i32, ptr %i.addr, align 4
  %1 = load i32, ptr %offset.addr, align 4
  %mul = mul nsw i32 2, %1
  %cmp = icmp sge i32 %0, %mul
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, ptr %i.addr, align 4
  %3 = load i32, ptr %blen.addr, align 4
  %sub = sub nsw i32 %3, 1
  %4 = load i32, ptr %offset.addr, align 4
  %mul1 = mul nsw i32 2, %4
  %sub2 = sub nsw i32 %sub, %mul1
  %cmp3 = icmp sle i32 %2, %sub2
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 8, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %5 = load i32, ptr %i.addr, align 4
  %6 = load i32, ptr %offset.addr, align 4
  %mul4 = mul nsw i32 2, %6
  %cmp5 = icmp slt i32 %5, %mul4
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end
  %7 = load i32, ptr %i.addr, align 4
  store i32 %7, ptr %d, align 4
  br label %if.end9

if.else:                                          ; preds = %if.end
  %8 = load i32, ptr %blen.addr, align 4
  %sub7 = sub nsw i32 %8, 1
  %9 = load i32, ptr %i.addr, align 4
  %sub8 = sub nsw i32 %sub7, %9
  store i32 %sub8, ptr %d, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then6
  %10 = load i32, ptr %offset.addr, align 4
  %cmp10 = icmp eq i32 %10, 1
  br i1 %cmp10, label %if.then11, label %if.end15

if.then11:                                        ; preds = %if.end9
  store i32 3, ptr %w, align 4
  %11 = load i32, ptr %d, align 4
  %cmp12 = icmp ne i32 %11, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.then11
  %12 = load i32, ptr %w, align 4
  %add = add nsw i32 %12, 2
  store i32 %add, ptr %w, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.then11
  %13 = load i32, ptr %w, align 4
  store i32 %13, ptr %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.end9
  %14 = load i32, ptr %d, align 4
  %mul16 = mul nsw i32 6, %14
  %15 = load i32, ptr %offset.addr, align 4
  %add17 = add nsw i32 %mul16, %15
  %sub18 = sub nsw i32 %add17, 1
  store i32 %sub18, ptr %q, align 4
  %16 = load i32, ptr %offset.addr, align 4
  %mul19 = mul nsw i32 2, %16
  %sub20 = sub nsw i32 %mul19, 1
  %17 = load i32, ptr %q, align 4
  %div = sdiv i32 %17, %sub20
  store i32 %div, ptr %q, align 4
  %18 = load i32, ptr %q, align 4
  %add21 = add nsw i32 %18, 1
  store i32 %add21, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.end14, %if.then
  %19 = load i32, ptr %retval, align 4
  ret i32 %19
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
