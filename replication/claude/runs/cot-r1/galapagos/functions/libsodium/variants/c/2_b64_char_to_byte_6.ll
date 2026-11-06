; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %w = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %w, align 4
  %1 = load i32, ptr %w, align 4
  %or = or i32 %1, 32
  store i32 %or, ptr %f, align 4
  %2 = load i32, ptr %w, align 4
  %cmp = icmp uge i32 %2, 65280
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %w, align 4
  %cmp1 = icmp eq i32 %3, 65327
  %4 = zext i1 %cmp1 to i64
  %cond = select i1 %cmp1, i32 62, i32 63
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i32, ptr %f, align 4
  %sub = sub i32 %5, 97
  %cmp2 = icmp ult i32 %sub, 26
  br i1 %cmp2, label %if.then3, label %if.end7

if.then3:                                         ; preds = %if.end
  %6 = load i32, ptr %f, align 4
  %sub4 = sub i32 %6, 97
  %7 = load i32, ptr %w, align 4
  %and5 = and i32 %7, 32
  %tobool = icmp ne i32 %and5, 0
  %8 = zext i1 %tobool to i64
  %cond6 = select i1 %tobool, i32 26, i32 0
  %add = add i32 %sub4, %cond6
  store i32 %add, ptr %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  %9 = load i32, ptr %w, align 4
  %sub8 = sub i32 %9, 48
  %cmp9 = icmp ult i32 %sub8, 10
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.end7
  %10 = load i32, ptr %w, align 4
  %add11 = add i32 %10, 4
  store i32 %add11, ptr %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end7
  %11 = load i32, ptr %w, align 4
  %or13 = or i32 %11, 4
  %cmp14 = icmp eq i32 %or13, 47
  br i1 %cmp14, label %if.then15, label %if.end18

if.then15:                                        ; preds = %if.end12
  %12 = load i32, ptr %w, align 4
  %shr = lshr i32 %12, 2
  %and16 = and i32 %shr, 1
  %add17 = add i32 62, %and16
  store i32 %add17, ptr %retval, align 4
  br label %return

if.end18:                                         ; preds = %if.end12
  store i32 255, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end18, %if.then15, %if.then10, %if.then3, %if.then
  %13 = load i32, ptr %retval, align 4
  ret i32 %13
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
